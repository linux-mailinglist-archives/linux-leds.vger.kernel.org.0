Return-Path: <linux-leds+bounces-3867-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 636E8A24947
	for <lists+linux-leds@lfdr.de>; Sat,  1 Feb 2025 14:07:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3C7333A7380
	for <lists+linux-leds@lfdr.de>; Sat,  1 Feb 2025 13:07:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72D8F1586CF;
	Sat,  1 Feb 2025 13:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="E/dlCQB3"
X-Original-To: linux-leds@vger.kernel.org
Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazolkn19010003.outbound.protection.outlook.com [52.103.37.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B272C9A;
	Sat,  1 Feb 2025 13:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.37.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738415227; cv=fail; b=JTBEHsSILBg4NsXr7OB1cMCH9ehWIZUFMoqaTmt89doK1CU6cjXnIAjjkhR8JW4nueFAYx3FO0iAabN+mnqBbcrNVVo0oj4DMTiiOLRZ0GpeSkLD1FnirtMA8a1ZGKtPDfYW0PEB442s4CrreiUpHypMa0qE0oS4yNiOrOryHcw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738415227; c=relaxed/simple;
	bh=lgiXXvCaKcBCyhP26HiVwsbPcg2M35/IDLImVgQ7rhc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oGCISN+omCnIVRUqpYg0DfP+OIdiUWMlxBs2ofn/nPZhBylkLR+xqVHY5jxK+Uy+g4DXSH80wmjyJI3xSuEXyQk7fEai/3uVi/Qx2tEpvGqtiSxn5WL0FYB0JggWvyOVoFaNW71hk/gJrXijsmjreLLdnnXginPXk1LAgi5wAuw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=E/dlCQB3; arc=fail smtp.client-ip=52.103.37.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ws9TuQ7K11x1r/3C77xELOxaTaAp7iCimevrMAyd5ecowvKSG3p9CQgdhFoPon/COLVaYQl6ZM6oCCJL2G1ficoDKCdlmc/u5FqARPSDZKuXhDLug/9L1KEhP9cfGwqeyl70TUWv2cHVfNy78oaNLvthCG/Ysnm7zPhPCQYQdJTyi4b72pnqOYI3eRYACilhTLk6zkV4uEpAKHSCuzYlNG5Gj/J2M0a3+HsQKEhzZUBId6qQnkwLUMRqSJex7l9y77/j3CL7q5mRKPhxkLIy0HHsLgPggSD4/gpJMbekrM3x+o7aW8Ce9Jbk3RAOReGKmkMOS3pGXlAasHGpbVhJiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c9v2O0/2Rxg68/EBe1Ab+v/cvXrGzztTeldf326wlbw=;
 b=Ku6nRBtXJ++VGBuWhqJHCKuFkMjXLo72odJjkGl4Cf3R5gx+7fPxv+l68zRlZk5XeiDstjpF6X1K9k5+gCqd9kzI2iumwsT9y0dkF5NtKyzaVLYBu9lb6n//LTJFCXLqjrIN2y346jyePFNMH1G9KZLjn2J5EySNlBSmgUt73QwYbonI1rp0bk1obGXn/mmxpJcECTJ2/+/XCHw0ukd83U3HiPa+zzme2fuUEjeyjIvfHXbBvKv8mLPmde+ye3Va6zmWHO0lsPq6juOSuTcLbuV3x2SEiVFfwY9uOvC3+1RrU6mvyIuk5Bx8KIM7AMckSEAxPVqCBbmS8n9xQspEnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c9v2O0/2Rxg68/EBe1Ab+v/cvXrGzztTeldf326wlbw=;
 b=E/dlCQB3n44y6NCPXD9MNoh5tariqiOcFcex+UR7KA3hNhL8/Eb8NGJPLkP5AUJFwVXvTjRBEPY4gMi7rCdcMA8s3/+ZNU8csTNhbyyuBgSNr64ecRJN8myxO8oUDhsBH9IMWey0aECcGOUtyAL5r53vcqhqpRsD4/dd2dsi3X+ejf/AoWhleG2kVBLKpt75ibjwUnYr9TDdB8N4TfsruFngU3RxHBselR5VZSdFu3ceUT8iQ9GlVwl2LAmz+TA2UkltkjrrBzycEczdPCMS6T+blGFqEaJ2t7Wdc+maJyM9LmMB+IbFFu9kCVTSiyU7VngOCBcwYSarHS47eHdCQg==
Received: from CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:160::13)
 by LO4P123MB6306.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:299::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.22; Sat, 1 Feb
 2025 13:07:03 +0000
Received: from CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
 ([fe80::c0fe:9ff5:51fd:3fdb]) by CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
 ([fe80::c0fe:9ff5:51fd:3fdb%4]) with mapi id 15.20.8398.021; Sat, 1 Feb 2025
 13:07:03 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: pavel@ucw.cz,
	lee@kernel.org,
	corbet@lwn.net,
	linux-leds@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 5/5] Documentation: leds: remove .rst extension for leds-st1202 on index
Date: Sat,  1 Feb 2025 13:07:01 +0000
Message-ID:
 <CWLP123MB54733FFFA3E71A1525EDE202C5EB2@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <CWLP123MB5473933B9B97137828ACC6A6C5EB2@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM>
References: <CWLP123MB5473933B9B97137828ACC6A6C5EB2@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS9PR06CA0527.eurprd06.prod.outlook.com
 (2603:10a6:20b:49d::27) To CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:160::13)
X-Microsoft-Original-Message-ID:
 <20250201130701.1703497-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB5473:EE_|LO4P123MB6306:EE_
X-MS-Office365-Filtering-Correlation-Id: 54d93622-d9a2-4c5b-a071-08dd42c15220
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|8060799006|19110799003|7092599003|15080799006|461199028|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2xX1PGTfp1Y8fpbjj8NjMuqWU6GxLwqgDxJLNsvmLe8eXoB/W2nIaY5LjXIR?=
 =?us-ascii?Q?zGJnTtC9P2TZ43Zcp8BYAzPqImMnJxsolsmYngoFavKx8GQvoJwnyOk0a002?=
 =?us-ascii?Q?Rwsxbj4FX8q5AJNPOHIBYYOsPMcGWl+D+h4y83mgujHwJKbZhhUZhMt3m3zz?=
 =?us-ascii?Q?QQM4aMUUsA7xMOBLqwGCmAykOOU8uk85ZMjK9+27aAt8WnhWeRMUpCGW6JH7?=
 =?us-ascii?Q?9pBr4WIA7ntqyvJAx18G/F4g/9cLBALPv5HbLig4c8rBN+CNc9Ep5dgIOEoM?=
 =?us-ascii?Q?D5WOyVYilnkzVtwADhVrTLKQ35TN7fUQJfVA76t88iWxKzYd1Eai+96r4vAP?=
 =?us-ascii?Q?C4Sev1xpxxDPgIka2qV4jlzE755uIhYwlrs6RX4+aWgVY6a4TedacSrKgJ1U?=
 =?us-ascii?Q?qSXKNk6jb8swUD6UMFkUFo4UimT9hASvDb0RLtI8md7bZcQL+ELN3csnK5do?=
 =?us-ascii?Q?DkRSpz64gNugknDYEEh6mwujzzMbajKGyMI+Aqv/ob9IX13mNOABMHrDl2f1?=
 =?us-ascii?Q?XgoFAq57tYN2IhWnNrcGS9lYYGcxPolUSxHW5VcuQNpLuHcjdu20J17uK2XU?=
 =?us-ascii?Q?vGDigFe2RQLZ3WVJCW9IIVdTKw7Z8lxdVPndbr72AfXDkgW5Gp0AYDaky3rM?=
 =?us-ascii?Q?ysbxKPukm6d9mV4chXnP4w03yXv8+6YVoaR3o0jQs3njmByu8sR7NJPeZUzK?=
 =?us-ascii?Q?WPUOLXbPWCdRyLvkp0HR4xwxGzHJw3Cnfu12E6Sd6odNTt4RYxwnNdeuD+bz?=
 =?us-ascii?Q?UmjLONoxfoHFqniFEotiziKZ8BcZwrglxL3ga0E0RkkuG8XukZVljbOBkKCN?=
 =?us-ascii?Q?l58g9RDM1u9daWq9RbeO71VUAhdmpZtCLNPnekYngPW3VeYbUln31Qnp/SCs?=
 =?us-ascii?Q?KDRy/gdxzKpeX1oyNiaWlBP64iAiVuHKmYo/cmPcy6ypmapaUyCySYdstuWk?=
 =?us-ascii?Q?HoikqISzjoKaTDHC/+uW6TuBkfiI8/5un8Y7g6E0cFHFfrSyTMy7ompJGdf9?=
 =?us-ascii?Q?AHdDc1G+tfb5NafQxbEBK3C5Iytc+pBQuY5ApPixDyaEzRKxfhRJljjXUPb3?=
 =?us-ascii?Q?TJnaSIrzPPMCqmVkLeumGruzCi9wdQ=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YLTAN0EiEuQGpmdA54Xuxv73EquVjJ4pASPvTEJFfzUJwEMiaXrWA0+HKWkC?=
 =?us-ascii?Q?pYRvbkxlweSSklG5M1MNVlfHpsTA2yEED80ygsKJlXutvSeBYA90J2oa/N+r?=
 =?us-ascii?Q?etRGtS6ABxWtrdiJoqI8kmLX4FBSzZxBJgEFJcpPS+eh1cnwLTh19NfP+Gek?=
 =?us-ascii?Q?5p2HmEUzsOB5ekAr00BPy9MIke8JScgHzA6CxgYRk8m4KqCFEZc8H2mrC4bJ?=
 =?us-ascii?Q?MrRLF+r6bLaxsuz4bpThADXBH5m2zC8z0sblQMKOfiMDkpO7S0RYOagEhZfR?=
 =?us-ascii?Q?eKyts5bH4uKgrsy0CggtUmPiKXJ6EwQVwes0y8kMgW95W6w0o2nA1vf4NbZg?=
 =?us-ascii?Q?PxlpUwQASCqQJmuMp0u8okVR6CWPFc6I/n+2egXRAAi0EdiCcFWLuLre5BsT?=
 =?us-ascii?Q?EDNFyW6iFRaaqE9OlwyMDv43DAk1+i8HUutORFrPxzJJhHtKnpWTwBWznF58?=
 =?us-ascii?Q?Bbh0Rx23XTayaiiqPnjVkGKzAVDM7oV9+PSAOSPed2Og9DvUgD15yaT4sIEd?=
 =?us-ascii?Q?ZRREP/eHv7OyrG3IPU5b/N/N6kGOpha37Wx8s6NY0qtqDOVUg8hojdsaQwin?=
 =?us-ascii?Q?wvog8y9oi161AZjMuYKuG201NOjxH5Ks054tnrvc123ZflSc+Jt/kt9y1AGy?=
 =?us-ascii?Q?/FT7VOLb1I76pD86hUJe4BULa+5zSDzB+tzJYKOLcI8iaIeFrRCUdrbUrIO3?=
 =?us-ascii?Q?DlHnWcQpbfni8WrMHnd9TaPLAwQTf2Rn89/Fsfvr3f08DAoevyufVdbGZD9g?=
 =?us-ascii?Q?7Mzncy/F4I1erC04L+O0lGMS8Qc2HbJ19XVYKZCtYfntA2wm36SQRE3NaWmh?=
 =?us-ascii?Q?VuWN6lN6Dsvn0K16XeuuvT1u2Ec1KYvjmlBbirMSQfpe03CFUm+vmPrCv14R?=
 =?us-ascii?Q?kjYx3lEDTWNwfgbV6WQHz1dVwWKqAk7gTY8fg9N50cV413ovRxro+YPamIRE?=
 =?us-ascii?Q?VSYxyLAc4RjK3kMPpLOjC7BZIRNTqLQc4mZMGtwGas70z2kAe8S9UQVQwx5f?=
 =?us-ascii?Q?fltwFM6pjdcmNXilnFbm/pTRXqmBi0O7fbXNe8FAmevwLiQzNa8cQ+hSzSr0?=
 =?us-ascii?Q?nuwM+f/aaibJ+wwFffGUCX9/v+bgNsEffd7YH0uOcqAgaAon2JKa2XekjYyJ?=
 =?us-ascii?Q?DZnfebBxYdnLyk/d0PKANbSLIo1wC8rC7N15sXrF7pMwVJpp2unkhkEulNUH?=
 =?us-ascii?Q?9/CmZBLAGArCY6MK4YZ+NdMIfSzs6I2cQNBNVa5SHetvuwnunF6yMp8FVNWC?=
 =?us-ascii?Q?ZACfivkQRbm4vSOJoZJewkgj9g198ghrrUjTpRNjB7PNWiZ1a8SWirrXoGgW?=
 =?us-ascii?Q?ch8=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54d93622-d9a2-4c5b-a071-08dd42c15220
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2025 13:07:03.4211
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P123MB6306

No other LED driver is listed on index.rst with the .rst extension.
Remove it.

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


