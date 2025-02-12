Return-Path: <linux-leds+bounces-3938-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8DBA31FB4
	for <lists+linux-leds@lfdr.de>; Wed, 12 Feb 2025 08:15:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 875E11674F8
	for <lists+linux-leds@lfdr.de>; Wed, 12 Feb 2025 07:15:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9076020409F;
	Wed, 12 Feb 2025 07:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wiwynn.com header.i=@wiwynn.com header.b="HRFGSExh"
X-Original-To: linux-leds@vger.kernel.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2068.outbound.protection.outlook.com [40.107.117.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96362202C26;
	Wed, 12 Feb 2025 07:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.117.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739344545; cv=fail; b=mdTXNvHUQ7yg6pmdPPlsSIE+nz9x8Dr1bboBdRBLN2q3sffe/BSHdRKP5P2qJvI3xRTgjC/K88JQ0zlJDBt1+YSDmKMTS+9d6LgjBEelVFeMwO5pRaYx5JjU10K5JGIIAhLVUNLyYavoxRtr8/ilJ6NzIpp+/cn+N98b6W5eNj8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739344545; c=relaxed/simple;
	bh=Zk3DoqduxtjJSU60Ndo/psC5gZzmvvsGEhNFMx0jcnY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=Z8NaEQG+DZJH3mk+p7MKJYFojVUeimptYyj6OE0OUf7OfCNxzLLdf0rOrdtzple+5fClRnjMEjuIEmY1FZVhtpM8/BG4OwY7qYOFh6cWxRvfjsXyi4hpH0gl1z5WhfSdUS/03RTrioJ5qGXvge7vIB5XCeFJtI8GmBvadh69q58=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; spf=pass smtp.mailfrom=wiwynn.com; dkim=pass (2048-bit key) header.d=wiwynn.com header.i=@wiwynn.com header.b=HRFGSExh; arc=fail smtp.client-ip=40.107.117.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wiwynn.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yEzg9XlN8b0cpit9D/pPbE1FFAfePKs0epcpYvPiUwFCqzfXO+Iu4WvK2E9EluT5Mee5p8vhNNXT7IXQ2SaioNH7/tFzM/ZxwBzpSjCjH79oUE+Be1mFydAr3EATxA1Ss4xxXdnxml/p5M3iVL6vljO4BHGkf+CO8wj3Ks4pSmU7xosiRRYj44XqUM5AoAdkbs3LX/eFGsq3zKpkk64TMLZhUs4B4BXmDt0DK1r7AWN6234gukklDzBn/04Axk42JwNxlmZ2/uQrwRCPFqmA4uhzhf+KgRoOYr8CiRI/0s7qkK5NXC82VWpPWbwjpnMKNBSAtKfuykUkXe/K8uJn5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2XJyW6bUH+83BtdjWG6Fx3r5s9KsJ0eIzk/W95CI8Nk=;
 b=hBMj4wcnN0juSxTXsQjWKaAO6wRiPojuVML+KB2LDQyiXjNReXD1QJsB0+xuByD4q6W7Q4rd/XdR6l0hVB9B+Eh8L6N+2m4fX9FGAtfcx8/r4KqKE3eDBOxnoJil5A5voXEb57kpG6x8T1F8bNqTf3cHCm4N4qaDBweF3B8a0SSBS3c2DnNKTcW5INGBbUBet11QvjHSsflzaqX6JkQDySFwkbEqcnU0MvhK8Cd3kHFYtQbvOOTQe4K5xk6j7lLjEaiIr4UAQ3zvC/FChReg9l8WEaiExJu82dLF6YAnN8FECNS8hTo250mropJ7Ku8PsiWxFZC+foFejPSPrszGBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2XJyW6bUH+83BtdjWG6Fx3r5s9KsJ0eIzk/W95CI8Nk=;
 b=HRFGSExhZ2ov2n8CnnBC0BKhMOg6M4nQQJBwAtl1Mmaf7pygKVN7x0FOXAVTx8n2dqK3SixR3j1jQN/nqaR6MK7qtT+2MH1bFqCRJdt6vdEWOvLqSOb66xum81XP83hZxq4eYuYFa+U7e9+Ho0IZYvrrsDNpgisEt1aylpqtOMzrQ+7aayVT5vRbEcyXKMF+IB0HXfw28u4QUhZdNa6DGvDETg8uEMljymHiP799pd1meXOoUEKYxltWEi27/Kd9+NBMSgw6F2eLzrwDvTGo9kfTnCOK+qEDaV0naIM4nyzXv+K3arkbmJ2dxA8Sj1XaBEGgEadFbLzyDFXcjRINOA==
Received: from KL1PR02CA0002.apcprd02.prod.outlook.com (2603:1096:820:c::7) by
 KL1PR0401MB6564.apcprd04.prod.outlook.com (2603:1096:820:b3::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Wed, 12 Feb
 2025 07:15:37 +0000
Received: from HK2PEPF00006FB1.apcprd02.prod.outlook.com
 (2603:1096:820:c:cafe::1b) by KL1PR02CA0002.outlook.office365.com
 (2603:1096:820:c::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.31 via Frontend Transport; Wed,
 12 Feb 2025 07:15:37 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB1.mail.protection.outlook.com (10.167.8.7) with Microsoft SMTP
 Server id 15.20.8445.10 via Frontend Transport; Wed, 12 Feb 2025 07:15:37
 +0000
From: MarshallZhan-wiwynn <marshall_zhan@wiwynn.com>
To: patrick@stwcx.xyz,
	Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>
Cc: MarshallZhan-wiwynn <marshall_zhan@wiwynn.com>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] leds: cat9532: support cat9532 in pca955x
Date: Wed, 12 Feb 2025 15:15:24 +0800
Message-Id: <20250212071525.1148988-1-marshall_zhan@wiwynn.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB1:EE_|KL1PR0401MB6564:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a1472dcc-acfe-49b5-ba0d-08dd4b350c94
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hL5AUsijZI7j2W4KkxsLQogyVkvMrxxaP16UqQg0aDSoNhxxpRDk4TqGEY2O?=
 =?us-ascii?Q?VYvfk+Qgd//uXO7f9wEPFUCd+r/ZXexMsInC67Ko7UYvBi90YMqKr0GU9u45?=
 =?us-ascii?Q?qeNd7aZ2psjCXMLHOiONjBIMX2vgIVUTbIxsKAe9FT0cp62vEVw9Mrome/zh?=
 =?us-ascii?Q?fOnaXnZocSE4GFkGv1odKIG3uTWhZ2+QILtUEOM9DwGZUMTiKdSDXk6AvSFK?=
 =?us-ascii?Q?mMWcZsBGpuTGBJJK3hAf3JbbIBBqD+2X7SgRK2wVm+zwWB15uVIDf6ipLTMk?=
 =?us-ascii?Q?rkPjjP+mdG89+lK1/w2MyLwc71SmtiH1LmzQKY5QpxJQcvdZXkfrAl1qkvJp?=
 =?us-ascii?Q?cisVUVal3VTKgR7PeisP8IU2r3ly507jLM2jzIB6i+U+c3EzaN8olh4ScFYP?=
 =?us-ascii?Q?CMyHr+V4DmDQG9XCQBq1tammCpr8iJGHRdMFFLXcTyPzLkEzcEOPlI1FuM5V?=
 =?us-ascii?Q?xZCO+oWZMglZHcfOpTyHaiyByRF4N6jf5rXrP4KjDtUwMs51eDMQ0JIMdPzH?=
 =?us-ascii?Q?HghB3GRcI7SUGb2MSZIIlI1jLXgdD2ehpg6s1RKgKocOrkQ7b5rR82iCvq9F?=
 =?us-ascii?Q?HDTaZrdh72R/WE3KNi0+CI+eb1PUMn7+io60iSOgl+5gaBT9D3YlzoOplHuz?=
 =?us-ascii?Q?pxW8gvN5m4psJ3E3WgYDfkDUBP57YbPMIEe48L1arFXqBmirumwi6VCyrJtn?=
 =?us-ascii?Q?lyt1zRPHOQQj9mnIcsE0KMq20M0GJ3gdCnXokQZ/rUEx36slpY38y+EAjWZS?=
 =?us-ascii?Q?t0MOfbrw6pT/bwiicTB212OiRGDqBGj+S8HvYQa7lRjZKRUVGA36bM7P3CDK?=
 =?us-ascii?Q?FNDGc6qbyukjWGAea4fMQqNugR6bnkviMt48OrOf06upSid2tg5PEMVTCVcO?=
 =?us-ascii?Q?/IRuK9ecmFAnk+9mhg8EorV+FhuthzK1FZYHBru5Ky063ysIRBo8s4PF4ICn?=
 =?us-ascii?Q?YZQyGHszTActKo5QHoj9R1+a9xsW54a5bqRUh0NYgCRV63U7XljOXt5RK0+3?=
 =?us-ascii?Q?EV+1uFSselu19cPg/xO0XyUCaM7M76QYRQjxLHteHJYQVnSIRwWCV5fk4AAa?=
 =?us-ascii?Q?5LjOnc7lJOg34t7WXf/h50WQk2yQpGeHtny7yOBoyVQZR/GyptxlWLnAiC4Y?=
 =?us-ascii?Q?OLm9u/NxdwOz7in+LdrFQu4R+E+dPC5jbZja7Kw+Y96N/l6VtfxOqLCtWC5M?=
 =?us-ascii?Q?HasQ5aKDTJTqduYSMOEiWGfqSnflCsktxr1E1YSwBP/DSiaHZYjsHwr6bjxn?=
 =?us-ascii?Q?XmCGPkhKNZQ7Pq/bAqJyXNPJIuDkOgca/TCFGXAUuSZtteumDTgNShXTIVVU?=
 =?us-ascii?Q?tN0XOfSxGTC85uJbuh1XerbCwy+GhO7m+WjLQI1YidXzvvA0kym3tDgmY67/?=
 =?us-ascii?Q?PA9Sm8mLVa1BsPrW3KFyX3TQNEAmUgJWE7DxkelcGvAlPFi19PYZbNn8ILO2?=
 =?us-ascii?Q?8shmBkR+M1mL64kXgu6Xqt6nJVvKYh11khrXsWzC6uCX9ZoYkAqq50BNmNRV?=
 =?us-ascii?Q?NenzdxvW1apEzMk=3D?=
X-Forefront-Antispam-Report:
	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 07:15:37.1495
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1472dcc-acfe-49b5-ba0d-08dd4b350c94
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource:
	HK2PEPF00006FB1.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0401MB6564

The CAT9532 chips are almost 100% compatible with PCA9552, except that
the CAT9532 used the opposite polarity in register that sets on/off.

Compare the state at INPUT with the state of LSn and dynamically
adjust how you program LSn

Signed-off-by: MarshallZhan-wiwynn <marshall_zhan@wiwynn.com>
---
 drivers/leds/leds-pca955x.c | 37 ++++++++++++++++++++++++++++++++-----
 1 file changed, 32 insertions(+), 5 deletions(-)

diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
index 94a9f8a54b35..c5bb81473b6a 100644
--- a/drivers/leds/leds-pca955x.c
+++ b/drivers/leds/leds-pca955x.c
@@ -13,6 +13,7 @@
  *     PCA9550         2-bit driver            0x60 .. 0x61
  *     PCA9551         8-bit driver            0x60 .. 0x67
  *     PCA9552         16-bit driver           0x60 .. 0x67
+ *     CAT9532         16-bit driver           0x60 .. 0x67
  *     PCA9553/01      4-bit driver            0x62
  *     PCA9553/02      4-bit driver            0x63
  *
@@ -235,6 +236,20 @@ static int pca955x_read_pwm(struct i2c_client *client,=
 int n, u8 *val)
        return 0;
 }

+static int pca955x_read_input_bit(struct pca955x *pca955x, int led_num)
+{
+       u8 cmd =3D led_num / 8;
+       int ret;
+
+       ret =3D i2c_smbus_read_byte_data(pca955x->client, cmd);
+       if (ret < 0) {
+               dev_err(&pca955x->client->dev, "%s: reg 0x%x, err %d\n", __=
func__, led_num, ret);
+               return ret;
+       }
+       return (ret >> (led_num % 8)) & 1;
+
+}
+
 static enum led_brightness pca955x_led_get(struct led_classdev *led_cdev)
 {
        struct pca955x_led *pca955x_led =3D container_of(led_cdev,
@@ -251,10 +266,11 @@ static enum led_brightness pca955x_led_get(struct led=
_classdev *led_cdev)
        ls =3D (ls >> ((pca955x_led->led_num % 4) << 1)) & 0x3;
        switch (ls) {
        case PCA955X_LS_LED_ON:
-               ret =3D LED_FULL;
-               break;
        case PCA955X_LS_LED_OFF:
-               ret =3D LED_OFF;
+               if (pca955x_read_input_bit(pca955x, pca955x_led->led_num))
+                       ret =3D LED_FULL;
+               else
+                       ret =3D LED_OFF;
                break;
        case PCA955X_LS_BLINK0:
                ret =3D LED_HALF;
@@ -276,6 +292,8 @@ static int pca955x_led_set(struct led_classdev *led_cde=
v,
        struct pca955x_led *pca955x_led;
        struct pca955x *pca955x;
        u8 ls;
+       u8 ls_last_state;
+       int inupt_bit;
        int chip_ls;    /* which LSx to use (0-3 potentially) */
        int ls_led;     /* which set of bits within LSx to use (0-3) */
        int ret;
@@ -292,12 +310,21 @@ static int pca955x_led_set(struct led_classdev *led_c=
dev,
        if (ret)
                goto out;

+       ls_last_state =3D pca955x_ledstate(ls, bit);
        switch (value) {
        case LED_FULL:
-               ls =3D pca955x_ledsel(ls, ls_led, PCA955X_LS_LED_ON);
+               input_bit =3D pca955x_read_input_bit(pca955x, pca955x_led->=
led_num);
+               if (ls_last_state =3D=3D input_bit)
+                       ls =3D pca955x_ledsel(ls, ls_led, PCA955X_LS_LED_ON=
);
+               else
+                       ls =3D pca955x_ledsel(ls, ls_led, PCA955X_LS_LED_OF=
F);
                break;
        case LED_OFF:
-               ls =3D pca955x_ledsel(ls, ls_led, PCA955X_LS_LED_OFF);
+               input_bit =3D pca955x_read_input_bit(pca955x, pca955x_led->=
led_num);
+               if (ls_last_state =3D=3D input_bit)
+                       ls =3D pca955x_ledsel(ls, ls_led, PCA955X_LS_LED_OF=
F);
+               else
+                       ls =3D pca955x_ledsel(ls, ls_led, PCA955X_LS_LED_ON=
);
                break;
        case LED_HALF:
                ls =3D pca955x_ledsel(ls, ls_led, PCA955X_LS_BLINK0);
--
2.25.1

WIWYNN PROPRIETARY
This email (and any attachments) contains proprietary or confidential infor=
mation and is for the sole use of its intended recipient. Any unauthorized =
review, use, copying or distribution of this email or the content of this e=
mail is strictly prohibited. If you are not the intended recipient, please =
notify the sender and delete this email immediately.

