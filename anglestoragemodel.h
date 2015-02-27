#ifndef ANGLESTORAGEMODEL_H
#define ANGLESTORAGEMODEL_H

#include <QAbstractListModel>

class AngleStorageModel : public QAbstractListModel
{
    Q_OBJECT
public:
    enum class Roles: int
    {
        Value
    };

    explicit AngleStorageModel(QObject *parent = 0);
    ~AngleStorageModel();

    QHash<int, QByteArray> roleNames() const override;
    int rowCount(const QModelIndex & parent = QModelIndex()) const override;
    QVariant data(const QModelIndex & index, int role = Qt::DisplayRole ) const override;

private:
    QList<double> m_angles;
    QHash<int, QByteArray> m_roles;

public slots:
    void addAngle(double angle);

signals:

public slots:
};

#endif // ANGLESTORAGEMODEL_H
