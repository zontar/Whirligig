#include "anglestoragemodel.h"

AngleStorageModel::AngleStorageModel(QObject *parent) : QAbstractListModel(parent)
{
    m_roles[(int)Roles::Value] = "value";
}

AngleStorageModel::~AngleStorageModel()
{

}

QHash<int, QByteArray> AngleStorageModel::roleNames() const
{
    return m_roles;
}

int AngleStorageModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent)
    return m_angles.count();
}

QVariant AngleStorageModel::data(const QModelIndex &index, int role) const
{
    if(role == (int)Roles::Value) return m_angles[index.row()];
    return QVariant();
}

void AngleStorageModel::addAngle(double angle)
{
    int row = 0;
    QList<double>::iterator i = m_angles.begin();
    while(i!=m_angles.end() && *i<angle) {++i; ++row;}
    beginInsertRows(QModelIndex(), row, row);
    m_angles.insert(i, angle);
    endInsertRows();
}

