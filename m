Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 204F63FD5C1
	for <lists+linux-leds@lfdr.de>; Wed,  1 Sep 2021 10:39:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241500AbhIAIkH (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 1 Sep 2021 04:40:07 -0400
Received: from mail-db8eur05on2080.outbound.protection.outlook.com ([40.107.20.80]:45675
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232593AbhIAIkG (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 1 Sep 2021 04:40:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D4tY8j2kiZB8Lc60aK6ZIHY1b9wtTemwf5MX1H4LYFBQ1VjjKdKqJgZGfOEtcx57QfhYGoyL7GlY5PkleC5KguVk0n/VWiwW7hcAPvDLKpHJtjdShIceEA9IRwqM/I/Y8GOKg7dbswi8os/95O9R/yehRewemWH8kTbUwxeouKR9hXr7TXSX3zKrttpu1U1ecPLXxMuW9+zseMAHwRCEBOOjieoIMTWlfM+ISC42+fYLoMZG78LtxnqK9j2R5u0rixjrCrboc5rFoBRLDHh5qog4WNgEitsyq7VpLSNH9kHpKGZEFYxS4f2/pUUTVydC7cUMBPnZGW+6SLfuYqweag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=4m1rhomZMY/C/DiMrAwXkyibef2OGHkUSolVnlj9FHQ=;
 b=mEhg4pMa7sJU1erT0K89wOMUz8pynlcLNTdMXnBbaT1SBvfZOTMOdNSGFSyNsQvvRxOw7KlpGS0wiki+dF40oGs5rhDIf01IGuiVIrgBEl83AMUfQJn/kQsWsCnfkyJD0oXMBllBtx6Gw6H1EQwl2g52pkQ4GWM0E8ZAJPvKY2BpbafaFM/3JCR2ouclpX6guZGE4/pmhsKF7GsjAiiouZlvhyGithwIQl6Rz0TnqmxX6wsq51EZIgsw0n0cqejROs/WqdpIPdJ11/1Yp9KhIhOUj82K5B7R2Lzx3A4h14m/RnwVdUJ0izXNgZCC3blduXmTkIwJMcS6v2Tb49zD8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=siemens.onmicrosoft.com; s=selector1-siemens-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4m1rhomZMY/C/DiMrAwXkyibef2OGHkUSolVnlj9FHQ=;
 b=E05QmVxcUdmeZoD6Vdg5Q5ouA9KVXjQpQwIultN4/z2bMAwggApgLhErzckxf3X1XLrR5cCaiLi1LTGvhQvRVe9SfXSBv792ZZJTYv+VQMRSDxWxRb0NZUVan2n5R97RyyuqN8W6NGbSuXLFjVrYGMzdEg1OYzKrcKNGdPVsLA8=
Received: from DBAPR10MB4219.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:1b4::17)
 by DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:13e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Wed, 1 Sep
 2021 08:39:08 +0000
Received: from DBAPR10MB4219.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6087:5286:e094:4fe5]) by DBAPR10MB4219.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6087:5286:e094:4fe5%6]) with mapi id 15.20.4457.024; Wed, 1 Sep 2021
 08:39:08 +0000
From:   "hamza.farooq@siemens.com" <hamza.farooq@siemens.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        "henning.schild@siemens.com" <henning.schild@siemens.com>,
        "jan.kiszka@siemens.com" <jan.kiszka@siemens.com>,
        "Haeussler, Gerd" <gerd.haeussler.ext@siemens.com>
Subject: Define LEDs with mixed colors
Thread-Topic: Define LEDs with mixed colors
Thread-Index: AdefC/4ZhHUj2Mp2SWmM9Mt1YYYklQ==
Content-Class: 
Date:   Wed, 1 Sep 2021 08:39:08 +0000
Message-ID: <DBAPR10MB42195CA4E52FDD30F0598AE98ACD9@DBAPR10MB4219.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Enabled=true;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_SetDate=2021-09-01T08:39:06Z;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Method=Standard;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Name=restricted-default;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_ActionId=4921ba3e-c1c8-415f-b8e2-63b946920111;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_ContentBits=0
document_confidentiality: Restricted
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5fc7206b-cafe-4e6f-6c90-08d96d23f6fd
x-ms-traffictypediagnostic: DB8PR10MB3529:
x-ld-processed: 38ae3bcd-9579-4fd4-adda-b42e1495d55a,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB8PR10MB352979BA4D40FD4D18C9F1F48ACD9@DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8G1eWkJF4qPybxRqrsFiynbeVfB/Pd66AwzFblN+w8PTlRoG1JNu2TSRdbx5txrYRX0k4UXuOZEU3WBEUF/0qb8EtUrGV95p7n+XkWYfBlqL/U/NhKm2JIss+TTrS1ij272e0wymImx4yZ+fW6QFif8xfGafosv5mrZZ5Z6H7mHhS+JMK9vfkX48eEaRDXSefvUbstdP2WLOPh3AMb2XptA2RtmOjyOokfId+gxSx0VWWHfKz84BmVV0dB3BP76YleiKbn50Wq9fYNHUv5C/fNvWnpExKKQSGA9+tPZuFLBNLHoYHyBnjeM74EM0PmCBmaleJC8lUl7N+k73RGB1duq+OKWeFYYobu5iIKrDJjrTsONSFmC0vGXhqK4zbJi5y6aI3fsVmBwV0vG3S5XYNKUF4MUGvhmt1uSN7T9yIDygvNHCcJwwfTvCFtgOrkqvWuxMBOlTv3C+j61gPgRj//H7Mas2Rc/fjVgTXuVLPYS1Hx3WuOQy1Ox/yNivO9/xdYwv20YQz6vAIGF4y50Bd4Q3GLTkdV1NzBrqL+DpeujNWj+y+83HX0+2N96X4W8mmS42yk6JafFYtlK/DtprKG1gd3njvkFNrHk60N0k6+B2r00EBdxXgfijdxogTQURnRKqNfq+elXuO9HL18WZ+SCKeABmO01V3xB4o1FVSOsV+d1SHPuOO3hNiU2SpAd21KYRzhhmDRDJJ17C0JIvQQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR10MB4219.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(136003)(346002)(366004)(39860400002)(4326008)(64756008)(71200400001)(76116006)(66946007)(66446008)(7696005)(38070700005)(5660300002)(66556008)(66476007)(9686003)(8936002)(55016002)(52536014)(6916009)(86362001)(33656002)(2906002)(107886003)(8676002)(478600001)(186003)(38100700002)(316002)(83380400001)(4744005)(26005)(122000001)(54906003)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?g5KxhHm8N1S5cnqyrx4yqzAYXN7dygmH6ZUtTuxTH4EfSe/47vdg1l7JEoJd?=
 =?us-ascii?Q?AIxLCXFeFj2OB4cBWicChgI9CoLhV1EokQ4+umhpIML/VF1mvBbooczcHvnN?=
 =?us-ascii?Q?3EiZFpuuRyFBeuL0lGp0JbIVlxSCYdTqvGaUuNEkF4Ki1HOvhKqM6QA3RaOq?=
 =?us-ascii?Q?1yoIiVmq/JmkTO6kF86abr6ns1OdC3v+F5d0JNJJDmQO1x6zG8ALWLEoFjBL?=
 =?us-ascii?Q?uNyZtnC094QmMuuXkIz2qtXMQqcukOZ1J6+Hl7z+ryMDQsyXmd3vZKV0aXXI?=
 =?us-ascii?Q?nb3UgGlm9w7FDjVftqSKLaP3rQGm7iQawNKFTqeUm97MooOL+nH23zIYwnoS?=
 =?us-ascii?Q?jKYYokW42WO/X8m+qMietULZN43DgO0RMB0BQx8vBSqLhrrXeOi04fRWU+H8?=
 =?us-ascii?Q?hPMN4d7TI5UchfflO4Kh+J9X61kf4nwBj3XcEHBgH0aMzI8YF5ZlZj5BJEs/?=
 =?us-ascii?Q?ymbks3XILmVTz8Gbtup7LukaR71Pklo4Uoyfk30GCMYZ5K/9v1BXwunx/puz?=
 =?us-ascii?Q?ZwLEZMUCUIZjnDP9l7aDnWsSwxAI5mKQGDx6psQcIhpU6O/KKW4BDFwCf81F?=
 =?us-ascii?Q?P/hwGtsU0/JIQj0CquMbTh2EsFf/w2CgtmRmOYqXiIpbXwV3lxYJtBibwvsM?=
 =?us-ascii?Q?yU3atg3vpWYFSfJKHXmEgUs5s6iHjltBUE8+MmLSnx499angmSTVsQqz8iNU?=
 =?us-ascii?Q?n8+SdpC9ZWuf0BvJYo8j7zv7ixaOrfxlywK9uFT+94X0hmeTcROh+QVpbk0R?=
 =?us-ascii?Q?EP5FOHVWbxHnahiTsj/a54lWDuPmOhdnYYOqb+sz0M75ktl4A1qmwG4WGNTS?=
 =?us-ascii?Q?qnD9VmeIqVCp3yN/zpiZNzm9xRKfPi+baABxCBQo34WkZ/ICZk6PwbpqVxnd?=
 =?us-ascii?Q?7qNvannqljXq2Mlqy0+tL6OQC6jcX96ReuEqLf5Fy122Ko0DTO3dBhqmVSs6?=
 =?us-ascii?Q?U5bPRglxaU3m/pDkwu31C43O55ZWnldZofhk7NT5alqs+LRwfQjPDk4v3W9h?=
 =?us-ascii?Q?Ysy19rt+uHTRC8Lr5X2OceGmFklxvko9zdCdpZCMsLpgi+acSQInFpyTc5Sc?=
 =?us-ascii?Q?Qnq6lIPIYxwby3L750yuD5eIJSKmq5hqcqHj/2ilPdTxenVBEs7LLZrONSL9?=
 =?us-ascii?Q?rNXOlqW/v9BtD4doeLW4646ZOMGjsgfUxv+2TIYqVMq9oyBc26HDdcIVU15B?=
 =?us-ascii?Q?8K99sRerQT3BO8ET32jZa2TiZePfy4Q68fbaiIFU9bqjBAHTizdhTj99vg+Z?=
 =?us-ascii?Q?pRqR8LSwgPYQIG9aIzlP+0OMQdImY68EaThRqefSRgo9+lbQ2nziq3cTxGK+?=
 =?us-ascii?Q?uD9Jn0Rd69ar0vMpN7iHdtYn?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBAPR10MB4219.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fc7206b-cafe-4e6f-6c90-08d96d23f6fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2021 08:39:08.3089
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LVfSCxrL+yE/WBXb1NIDp7u+shMPNQ8HaonThNnuf8NPcoCmUEE1c0yKArNkzGcV2/GrOSvEPe4eHQGOQ+zT+xiIyldq7iDWUtkeaRPr1yQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3529
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello all,

I am toying with the idea of writing a multicolor LED GPIO driver. What wou=
ld be the right way to define mixed color LEDs (for leds-gpio), in device t=
ree or ACPI?
Consider the following:

leds {
	compatible =3D "gpio-leds";
	led0 {
		gpios =3D <&mcu_pio 0 GPIO_ACTIVE_LOW>;
		color =3D <LED_COLOR_ID_RED>;
	};

	led1 {
		gpios =3D <&mcu_pio 1 GPIO_ACTIVE_HIGH>;
		color =3D <LED_COLOR_ID_GREEN>;
	};
	led2 {
		gpios =3D <&mcu_pio 0 GPIO_ACTIVE_LOW
			&mcu_pio 1 GPIO_ACTIVE_LOW>;
		color =3D <LED_COLOR_ID_AMBER>;
	};
};

This probably won't work as "gpios" seem to be single object in gpio-leds d=
river code, but what can I do to achieve something similar?
It is important to define this LED in DT/ACPI in order for the user app to =
see it in the /sys/class/led folder, without having to write platform-speci=
fic driver.

Best,
Hamza
