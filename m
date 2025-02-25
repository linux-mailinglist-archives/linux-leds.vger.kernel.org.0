Return-Path: <linux-leds+bounces-4081-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC2EA44F7D
	for <lists+linux-leds@lfdr.de>; Tue, 25 Feb 2025 23:02:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE42219C1FB2
	for <lists+linux-leds@lfdr.de>; Tue, 25 Feb 2025 22:02:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F28CC1D959B;
	Tue, 25 Feb 2025 22:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="Yp9EJthI"
X-Original-To: linux-leds@vger.kernel.org
Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazolkn19012062.outbound.protection.outlook.com [52.103.37.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A42518DB2F;
	Tue, 25 Feb 2025 22:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.37.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740520964; cv=fail; b=jp48uWJMdrYhgf7EfdKCUPhbzIkxTZthLn1s3UIwktEDtvwdMfGKIUkSM04H5uBHYI74yZw4nce0kFs5QkNTdZYG5k736qBcMQAvPAocuyK4PKSamPjsEjIvYDZo0ouiC3hnnpbPMQMj9hEFse88l8qtdQhrVwGGnTE72sJ4a2o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740520964; c=relaxed/simple;
	bh=QGNiDF2xv4kbWZaBAoyTfsJHBnjLyr6AbfKblxiZjsE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nQZgy0Os3qGMHFxeDAISvPyg9zVxvFhgaW5L2p5zQYynE3PM5w4cmOlh+RbWEe0KFlzz8NB9e72GV8Iaf2Y27OWBk7U/Z78ZBi/FPAzcYkGJIxHcVfmRpdUfDRAm4pWS28G9olnzrX4vNeD+a6xuelgq20DO2TMoBbXztmDesx4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=Yp9EJthI; arc=fail smtp.client-ip=52.103.37.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lz2xTZF80u+hntn5Yzkf9SlplOGxJbbgQ7lmqPfuMQijLFED4VdJ8IY0EJaFCpwJ4QbOVqq6P6ukcFraYNEZ63BfgpBXsZPyU3B+720L5xXQKc9/JifehYCDUWmB14++x3eAvIwbOQkZ24a0TDlZ03A8+y3O83LLgc4JWGLuiSjZweiS7+AZcP4pMMvFXIuREFMCQa/iE4CVrQoPjGeRvgaHLNhCNViy6dhKZtptWSlqqq6GwEqJN2pHh5L+2aaffzx2kQhUUQKtDybyua46pPxm7O0oWFlpX2g5ngXzEu3SJNTMXdVtjrAATCHelnxjuURcyKgvIYE+GVhdX2w0xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nnb72nhHoK/BdwoTKU8E/xRkDBsQOBKurR3CpqvTAVo=;
 b=yKCDk0aKMAzUoQcy4nZlk5i8tACE8GuVhtk9rWpYcY/n2M3ctNHYKdbTXMCuDx/F2eWaBrCujwZ7/PVGdzWQwWGCmykHiUm8g5qfKbu3FZKS8/2PobzeOIi0K2XoYt6d9hD7Oy4n93YDvcX6hVypQ/IPFTBhXGVRYSmjr6ZcrgGg6qWNrVu05PZyAgUK5OX1cBEecmah5rCO0IwTleiZJbzU5XBc/0VjfDrFY3O37Rsbv42JG6f8iyiiNvPqQdqNdeT5HOeOuhdin511XUATBd/qP6uIiRuoMtr8NOZHRabNfWsw0em7LcRePhbenVnAwGl80tLniBXwYEf1Cyh4QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nnb72nhHoK/BdwoTKU8E/xRkDBsQOBKurR3CpqvTAVo=;
 b=Yp9EJthIew4PPH2dQnd1LKl3mgPSuftf3tBEQVMEfp/hvGQZ/Qv/ppUkkrc9EYYVMv5bT2OjH7yyLXU7Yh/q5uG0eh4Y+xtlljquJqKdJEpsMNPyelaovYtaIJ+PxLNuRzd+dnjC0hcrry9/WLByEzKkaI4doigpWK1n9ZBNgelrz5Fo8uegG/nvjBLjkjxkr+/l6iHphMAAb4F4IxdTSpkiVz1+UIZICX3EXhMKxu3h+rLkaJcvgAdJw6fsAUqUBBLP7Sex/DMToGfRjTy8+bgZ5cl2UeAY+0VZF09XlLlNERWKBAaG3dsKHSeb2PlmMGsmMwJ+YqyORiqtbFS8SQ==
Received: from CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:160::13)
 by LOYP123MB3280.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:e1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Tue, 25 Feb
 2025 22:02:40 +0000
Received: from CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
 ([fe80::c0fe:9ff5:51fd:3fdb]) by CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
 ([fe80::c0fe:9ff5:51fd:3fdb%5]) with mapi id 15.20.8489.018; Tue, 25 Feb 2025
 22:02:40 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: pavel@ucw.cz,
	lee@kernel.org,
	corbet@lwn.net,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] Documentation: leds: remove .rst extension for leds-st1202 on index
Date: Tue, 25 Feb 2025 22:02:28 +0000
Message-ID:
 <CWLP123MB5473137572529F99746F4AC4C5C32@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <CWLP123MB5473552E76AE71CDE3085DA9C5C32@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM>
References: <CWLP123MB5473552E76AE71CDE3085DA9C5C32@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LNXP265CA0094.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::34) To CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:160::13)
X-Microsoft-Original-Message-ID:
 <20250225220228.1665783-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB5473:EE_|LOYP123MB3280:EE_
X-MS-Office365-Filtering-Correlation-Id: fa4049ed-7343-4c77-29ff-08dd55e81ed2
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199028|7092599003|15080799006|8060799006|19110799003|5072599009|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?meyaviek7WmbMaALCmomf+xfyVbcgNrCVpCLIpOemP8s2McFwUeklJB/+Ome?=
 =?us-ascii?Q?k/rQ0w+9dacxnMVGmaoKXHyFPKhz21dkDQQuYHokDjznYcEb5Zjk8Uys/dJW?=
 =?us-ascii?Q?2iRMJ2bJXQtnQAHiRbkdmW5xgnh8vN+vEGNOa3JUhFrux49W30mdtqnsdz/g?=
 =?us-ascii?Q?RSs7GckHyE384s3kC+6D4Wd6ahtJAhp2BQDWIviK+uusrIZnR6W2BZgZNegF?=
 =?us-ascii?Q?zsurEEYHmkr86lWsPXtbXzyr+WwiiqEOufZre8jKmC7QI3fiaiKn8TR3k7vH?=
 =?us-ascii?Q?eGZG+XzG0ihyzq09pi0QnyS23nm2BxPgrMWhYrj78s57yngrhL4F4TsdhPEC?=
 =?us-ascii?Q?O5GeVBEhG9H4/W+FHBL/pFLEZZdy0euAPEb/2Pn0EA2HmPVar06sunnGzYo5?=
 =?us-ascii?Q?QjVF/LQVSVQxX/elhRVpOaRtCYrrYwj5zd1U8f/UJXvHbjBRqN9Pmx51s9Jd?=
 =?us-ascii?Q?fzs0RjMl8lhGX3yZ1egUH8lxP15A28C5KlpUiqJhNvYyrNm038ZCTGRV76K/?=
 =?us-ascii?Q?OihoNH41GnMDBzaGNriKiBKT+i72CcixJiR0ns4wCF6J863yBvOHsJ4vhRji?=
 =?us-ascii?Q?4UxIcHTmQfp4Jkmw6881QuNV8WkLPXTsbS+1Bh0HH2s+4P7UQc7XuWk2CuFS?=
 =?us-ascii?Q?/5AAHGmk1s3Ug72ZYQvMXU1IQO2VqGdtvxHljRbW8qyr5VJJyjm5TKEuYfNc?=
 =?us-ascii?Q?J8Nngp0DEEctSVA9Rxur85iQP8CAxjqLVP+ikR2r9C4bt5VxamQS7x6bHNK+?=
 =?us-ascii?Q?wTKO/2sP3HWxZRvsUgvawaAqTd7HUIR2Y6h4xMXOGXLzP5IitZeXURgmxqEp?=
 =?us-ascii?Q?AVDMy7S4OYp1b4uKUw1jX+KvH5JVoMs935mwX7IpqfXBkFUC6NmddBK+HOjI?=
 =?us-ascii?Q?cI65RGFJE8yh9wweqfNlIl0r/3FI6V8wBj/GeuTMsA5QU80jkhIPH0Eb8pqf?=
 =?us-ascii?Q?KXg5ibTrSMx6eqreEeaTfDP5z5fP+EJAgGfSg2M3cVZGk5r3AxnRJIOnQ8HD?=
 =?us-ascii?Q?d6Vbc30q8cFy8vclDpflad3jWEHlaiVS0aoQ0KjP3pLikHAJKZezHNLh9zcc?=
 =?us-ascii?Q?52cS8jzAy6HitJg6XVTsF0b5LXwisA=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7S2Nz944YNgwtYNyHMjElHpnJwmTM98Vdkl2n+snt0+t1RXsJSwdeAau180P?=
 =?us-ascii?Q?Bs2Yaai6OBbYFFncXidWzNnrTGMkDjnR8zV+81i6w711e95IUgJSiCppMooS?=
 =?us-ascii?Q?0vMs5TAxphDRey5cMsM/ikfdtGjzH0UcW2B9lTFp/Nk6M1pTN1a4eh+XPQ3q?=
 =?us-ascii?Q?GBR02xEdw37mygaQ2DPW1dbFJ+vhB1EQjvoeYq1lMRaus/lD7oEegHTuKlv3?=
 =?us-ascii?Q?zetRJUSDMYN5xgqrCH+1+6Z1waEYq6Q2nPO5Xt4jBeMdTr3dNUyW0HvehCPu?=
 =?us-ascii?Q?9uxNm+7khtTXEQjaFqE86gxvvX8CFygHOnkJ9eeMMaNzS0mbkxgHKKBwdNHn?=
 =?us-ascii?Q?+cx7Yy4NALz8HNV13y8LOsUzUZIImerWUqkicLOoZVXmHJucg8IaB3b5Yxzf?=
 =?us-ascii?Q?9p2BBi5WdzXAzxbu8Yq2bi78kfHcvvinj7038DlX+6EjeN2WcTS3RRqzzPw5?=
 =?us-ascii?Q?pp9Pc62onvuHyzZH6s39k0P5ANunhXSoqo+9nwX8Dad9aMqY4WGS5I+SU6Rk?=
 =?us-ascii?Q?MtlL3ZXohCMAv9wgwlzkUS583M5L6SQHTrzCdbkbC0HtEjojY/rPCHKGVUuY?=
 =?us-ascii?Q?+nf/BaaEY3fboL6vZMz2VhMJs8O4/COdsQ10bla/Ayq9IZci75Y24YZ6rR+s?=
 =?us-ascii?Q?/AQ4IGZsvvyiDlJze96JH/uvJ+fm6b72Q6Eu4QdXqNIqGZrJSBjaBsmLXfi8?=
 =?us-ascii?Q?5uLQEGHbWvJoBzkiY+BJyXrDL37ljfTiZBuzhtQleE8DEsXnYygRHSGlJsf6?=
 =?us-ascii?Q?ghKZbQE5btxs59jPyODGJieL5kpiu1zSl6V+aBiJxdo2ueE9h/SqtobjuHUI?=
 =?us-ascii?Q?FAYcIQVymvmwLY8nddZvg9LZMWkyAl7SL82rcnbbo68ErspHbAQ+mjM5oRnJ?=
 =?us-ascii?Q?SY1cB+djG9/3YiDyF9p6uY17+pEZWxVERpj39gR3tjQ0lvibQde8oa49YZJ5?=
 =?us-ascii?Q?UohJHMvoJQWofBK3XgJktoLZ5iJsvkZ+j8Y+2VG7aaq5uXLOwmohRL/zPYF9?=
 =?us-ascii?Q?mmtGFTFyo9IpxPpW8B6OrhjtP+VM1eD+R2uG2PS9Mm4kk3GomXd/aiiLTtjk?=
 =?us-ascii?Q?gyLRsJTi801CVGTwCVo/3XgOYRaXwg4uz6JCevOvQNZlalBasBG4H5VZtlBr?=
 =?us-ascii?Q?KBdt+wb8IvuhJS14ZBjvvrhZCLuE7TxADC/8qIgsy/Cj9jaZrVAwB5Xbf7e4?=
 =?us-ascii?Q?WIrYZhmxJXIxMiDI5yFIuW39eLhmXWOstTJy/4sMaRAgSRAROgQsOdhSdXch?=
 =?us-ascii?Q?+sgf5tff81mnG6FeI9BnXthpacdHSka75uDitgtEQ2JxYrOZ77vLcQnWconX?=
 =?us-ascii?Q?F04=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa4049ed-7343-4c77-29ff-08dd55e81ed2
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 22:02:40.2887
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOYP123MB3280

No other LED driver is listed on index.rst with the extension .rst.
Remove it.

Fixes: b1816b22381b ("Documentation:leds: Add leds-st1202.rst")
Signed-off-by: Manuel Fombuena <fombuena@outlook.com>
---
 Documentation/leds/index.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/leds/index.rst b/Documentation/leds/index.rst
index 0ab0a2128a11..76fae171039c 100644
--- a/Documentation/leds/index.rst
+++ b/Documentation/leds/index.rst
@@ -28,5 +28,5 @@ LEDs
    leds-mlxcpld
    leds-mt6370-rgb
    leds-sc27xx
-   leds-st1202.rst
+   leds-st1202
    leds-qcom-lpg
-- 
2.48.1


