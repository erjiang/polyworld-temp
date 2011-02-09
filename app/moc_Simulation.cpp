/****************************************************************************
** Meta object code from reading C++ file 'Simulation.h'
**
** Created: Tue Dec 28 14:50:30 2010
**      by: The Qt Meta Object Compiler version 62 (Qt 4.6.2)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "Simulation.h"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'Simulation.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 62
#error "This file was generated using the moc from 4.6.2. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_TSceneWindow[] = {

 // content:
       4,       // revision
       0,       // classname
       0,    0, // classinfo
      15,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: signature, parameters, type, tag, flags
      14,   13,   13,   13, 0x0a,
      25,   13,   13,   13, 0x08,
      34,   13,   13,   13, 0x08,
      41,   13,   13,   13, 0x08,
      50,   13,   13,   13, 0x08,
      58,   13,   13,   13, 0x08,
      83,   13,   13,   13, 0x08,
     104,   13,   13,   13, 0x08,
     126,   13,   13,   13, 0x08,
     151,   13,   13,   13, 0x08,
     175,   13,   13,   13, 0x08,
     198,   13,   13,   13, 0x08,
     218,   13,   13,   13, 0x08,
     236,   13,   13,   13, 0x08,
     255,   13,   13,   13, 0x08,

       0        // eod
};

static const char qt_meta_stringdata_TSceneWindow[] = {
    "TSceneWindow\0\0timeStep()\0choose()\0"
    "save()\0saveAs()\0about()\0"
    "windowsMenuAboutToShow()\0ToggleEnergyWindow()\0"
    "ToggleFitnessWindow()\0TogglePopulationWindow()\0"
    "ToggleBirthrateWindow()\0ToggleOverheadWindow()\0"
    "ToggleBrainWindow()\0TogglePOVWindow()\0"
    "ToggleTextStatus()\0TileAllWindows()\0"
};

const QMetaObject TSceneWindow::staticMetaObject = {
    { &QMainWindow::staticMetaObject, qt_meta_stringdata_TSceneWindow,
      qt_meta_data_TSceneWindow, 0 }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &TSceneWindow::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *TSceneWindow::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *TSceneWindow::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_TSceneWindow))
        return static_cast<void*>(const_cast< TSceneWindow*>(this));
    return QMainWindow::qt_metacast(_clname);
}

int TSceneWindow::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QMainWindow::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        switch (_id) {
        case 0: timeStep(); break;
        case 1: choose(); break;
        case 2: save(); break;
        case 3: saveAs(); break;
        case 4: about(); break;
        case 5: windowsMenuAboutToShow(); break;
        case 6: ToggleEnergyWindow(); break;
        case 7: ToggleFitnessWindow(); break;
        case 8: TogglePopulationWindow(); break;
        case 9: ToggleBirthrateWindow(); break;
        case 10: ToggleOverheadWindow(); break;
        case 11: ToggleBrainWindow(); break;
        case 12: TogglePOVWindow(); break;
        case 13: ToggleTextStatus(); break;
        case 14: TileAllWindows(); break;
        default: ;
        }
        _id -= 15;
    }
    return _id;
}
static const uint qt_meta_data_TSimulation[] = {

 // content:
       4,       // revision
       0,       // classname
       0,    0, // classinfo
       0,    0, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

       0        // eod
};

static const char qt_meta_stringdata_TSimulation[] = {
    "TSimulation\0"
};

const QMetaObject TSimulation::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_TSimulation,
      qt_meta_data_TSimulation, 0 }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &TSimulation::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *TSimulation::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *TSimulation::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_TSimulation))
        return static_cast<void*>(const_cast< TSimulation*>(this));
    return QObject::qt_metacast(_clname);
}

int TSimulation::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
QT_END_MOC_NAMESPACE
