Return-Path: <linux-leds+bounces-3816-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2596EA15A0B
	for <lists+linux-leds@lfdr.de>; Sat, 18 Jan 2025 00:41:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 29D7A7A33BF
	for <lists+linux-leds@lfdr.de>; Fri, 17 Jan 2025 23:41:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 212AF1DEFE3;
	Fri, 17 Jan 2025 23:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="meMnbOpD"
X-Original-To: linux-leds@vger.kernel.org
Received: from GBR01-CWX-obe.outbound.protection.outlook.com (mail-cwxgbr01olkn2048.outbound.protection.outlook.com [40.92.112.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53ED51DED71;
	Fri, 17 Jan 2025 23:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.112.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737157246; cv=fail; b=UEZrogm2kHhXOKAfaQFsZslxhPHEzlAlWyDM5HeHS7Cfe3gVvk+CjtgTFPL6XBlZkUkR0pNxSq40/2u+th7CX7PsZ/Z01gljWe/AndcjWsKVCB3aCeK2msei609TKTIVUwPHyWcY2j2iXdQ2/puBMdZ8llpb3ZJzGLd4l/dNRKI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737157246; c=relaxed/simple;
	bh=lgiXXvCaKcBCyhP26HiVwsbPcg2M35/IDLImVgQ7rhc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XgxBKHGPWsXHHZsr1jbkA4PzTO57bD/QNBVhpXIgQIFTOa6Iffn5qfsMcf42PJwe8SimitbTR4js4xCccSoEs/5ZOmr/mGUn21/6ADuxuKRmogB+wnH+Ut/RoYvspHeiMDLTGZ8h0EWCES8L/OCFHe6inlbqR3Ci1w/88jsQ98w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=meMnbOpD; arc=fail smtp.client-ip=40.92.112.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZQqbN+TzuTAxDh3yuI2N44sZSLzb1xNlt8h91TDrhnCFRDjAzx+mlg714PH/gSjKCA1hANuPqtHchvd/KHmyZpDCyVAzE0+XimvUkLt+CUww1wKvxcghipO1mfmqyTlQy926SgoNixEPsX+FHxp9sC1nhmHXoSoXwCPhLwaMQqdLdrTvQe9q4cpbmRHVBCiu34I7HGtHeFgjEgIhWrEcA3nOPpve9Vahz2mE36qe5wUp++NtduvCWsB+eMw0K/6e0TE2bPZJkP7jo85acFxCR9sR2ijoxRQwQGnGIWTZ3jvfe/jineQlG7zl6GxTGyVmKjzb6h7AZvnDXw+pnbGPhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c9v2O0/2Rxg68/EBe1Ab+v/cvXrGzztTeldf326wlbw=;
 b=tUOQfhxUna6JH0JXddhVZnaOsa06hYEbutrliB93e14kBleUHrTlzsnxZnX28Fjl3U88hutGhagaa/Q0wecqEm9mcnL8+jo5MhKPNwBi0plIYi0pBrYIpE8P7A89S3DmhUu/LGUdtQAe//yFjCDB0O5G6ve92TSxEKdbqjfEYB5zkMzMCyjmG6h9D3ybM7noXUaWy2P9bXtKMMUpx5Dpk6MYiCK87WukGJrwf14LVRmPrXecoxMbLVNtRMN0CAX+6VaqqkMKmLg01WC45wguKirwIj9NXxP9RpPfPy3d4km0Ch11frN6yhmsmnZrLJKO4i2JYtgJEokbV26K95t7XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c9v2O0/2Rxg68/EBe1Ab+v/cvXrGzztTeldf326wlbw=;
 b=meMnbOpDAs3inAx3/hB3JrkmVDIlOWnUcGAl0PZy1hcehNiuva1G69kESfXZW4n3wmENnA8wVP3abLkAyNr644wt9m1FuYuL8ShKCN99chn+Z0PEEHDQLXlkXxFuJb0aIPuY3QjkZzctN1M93xfbj3IDUsP8OcF5FC8WbTrRM/CBRgIsKbkNzxvB5W9OomS/EzF31zHJ1nu8RR/MPmVIEmY373BSyTUPpT2Z+OacreLUDGc20HtX0x258IfQ54zaDhsPtjAnC/mMgEggunPteO6Tf8xt3Vmf4wRo9Y1KWKYc18SlWP/lP3I1iFeFSIRHhN9YIe6U6jvLR3jUw23DGg==
Received: from CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:160::13)
 by CWXP123MB4166.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:b4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.17; Fri, 17 Jan
 2025 23:40:37 +0000
Received: from CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
 ([fe80::c0fe:9ff5:51fd:3fdb]) by CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
 ([fe80::c0fe:9ff5:51fd:3fdb%6]) with mapi id 15.20.8356.014; Fri, 17 Jan 2025
 23:40:37 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: pavel@ucw.cz,
	lee@kernel.org,
	corbet@lwn.net,
	linux-leds@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] Documentation: leds: remove .rst extension for leds-st1202 on index
Date: Fri, 17 Jan 2025 23:40:31 +0000
Message-ID:
 <CWLP123MB5473872C55D085611737E009C51B2@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250117234034.670794-1-fombuena@outlook.com>
References: <20250117234034.670794-1-fombuena@outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CWLP123CA0273.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:1d5::20) To CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:160::13)
X-Microsoft-Original-Message-ID:
 <20250117234034.670794-6-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB5473:EE_|CWXP123MB4166:EE_
X-MS-Office365-Filtering-Correlation-Id: e5c147c7-00f2-4781-c3c3-08dd37505832
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8060799006|15080799006|5072599009|461199028|7092599003|19110799003|440099028|3412199025;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0hwVoKb2SfpextlL0B123xlm0bIdAWDy49EqnFulgyw4PxVRgiagKoASFcUO?=
 =?us-ascii?Q?i7imWRUyoyaOU4sTXw3P/z/1bAmPGIp0zauHRYeKTBS+MD4WFsmTX9hQ8MX7?=
 =?us-ascii?Q?AQrNoQNHyIdpUdwBtVDv8bO3UjKt7AT00R2j4ja8hKqRkMCtsXMNpKYFznAc?=
 =?us-ascii?Q?4C0KCGJ5qpMvRQzVhCMC4JkQk/XPoWFYVsytTLL7A3p2LllwdUQCPl7lE6HQ?=
 =?us-ascii?Q?D3Cds+m57p50tsMUJ07JfwgUV1F/QdZ44hguZEuCtTWr2BQKkuVyLogwGfuD?=
 =?us-ascii?Q?YoYdBfBbulfdYzBH2jzF+LRlxkAI9+Nm53YWd6ABwZkAGtKdJcRrgB3j6K4y?=
 =?us-ascii?Q?B4ODRmf9zePyTLhOhioAj3ClAIiOJO4NxS1+JGHeAGA1Z1RgitQmuN7Ok9im?=
 =?us-ascii?Q?GP78wLombAMJzQnD42UMefGsVJ6GBLlGPod45ENIgitTBYSPUCr+wjbqqsJL?=
 =?us-ascii?Q?bTx8vmt6pgk8N9mjnJE/yEfipSbHg2CPjcyugpw+d6gD7tNItvLJCMX+clez?=
 =?us-ascii?Q?QZevvp/RtwN2kZlzy/1671uaTnJ6X8XKSshO7b2pumHJxTzPDnil9F+tEGeW?=
 =?us-ascii?Q?Yay0neU9jpLGxED1KKz/hvVWp0G9VbpVezNOBdnSD6Bo7ezE7Ndr0uFP6y8N?=
 =?us-ascii?Q?BcvmM282KLFNwC7FuUSnoC3XKyxALs0D4ZnAi+zV9G5y6mkH1uyRbNH4/yZZ?=
 =?us-ascii?Q?zM9BO15EpzVIf1Pu+GpLdwfXOeWUDG5+SUvQn+En6Hq5RuIbzMQrkSRTZ8CH?=
 =?us-ascii?Q?GJewSHngFnb7NLFCZ76CGD50YmQGVz76nr1+Oe7+rLboURBxC7c+7I+rqhjv?=
 =?us-ascii?Q?pyfUrm4nfhWvmIhBSfU0FSalKE8LK+DTkzIgmQDVuhWAjjRRMFW2F9wJgIa5?=
 =?us-ascii?Q?fpLJdYFVuaViRrupzJQi2tx3EzYFQdKVWnlDGK1SJ8Pnqt1Z0UBTER9hxG9s?=
 =?us-ascii?Q?9d6rzch6b5hc78+F0igjzRu0IojoqVveAIFLTf3pkwSXF41LLFablJKCc9cn?=
 =?us-ascii?Q?LnFyw1IjAmRFN6Wh9GS7y3tsZ1iqtM8oCUJG4/P9i+ue+kAgwKc8JDg2cdv1?=
 =?us-ascii?Q?Wb/IJ/sAQ2HzWrx0ouPSNrTOmFDugg=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Y2NHcSOzoaCFqwJQSx68tPtJ5Mr6O4I8YAqcXR1NwwgGcL+A0e1JrBV/AR6R?=
 =?us-ascii?Q?MwJpQwzs70mXx4g6+z2mKe3IUtFDfs51U2uhgHRdPA6DqeGoabT812QCaxdz?=
 =?us-ascii?Q?wJ1dA6GmuNlsb0kSaLPQBRp71UswNc7wP4QUGVIpjtamthLkhdNJFB0JHr5/?=
 =?us-ascii?Q?VUaze97jXHA8R4loSvZ2hu7cBil92E334zM+gtIh+KNCea2wkdkZffgYxKh/?=
 =?us-ascii?Q?MLILYYZyuLXieJcEe+suRtC3QHHDsvSGzVvIJMPa7nXzuFShGrd5Xvp8OmNH?=
 =?us-ascii?Q?PZcgaxj1D0QxENVpw+OBE/0qkeHRyeTZPBMaGzTJfYun6gfClNAOHdxNSCxf?=
 =?us-ascii?Q?hvQTTDwK7OA02NRbu7W89sfOoWMPFo4NIjm241eiOsWC/9xNiUK4N1x5v1FU?=
 =?us-ascii?Q?C34tTA7HQdpVrubIvOpjeNLalfQH3eyg2PpAgJN3NMAEctHyIEqi7Vct4Fu3?=
 =?us-ascii?Q?MM8TrOUWr5XYpldOsvkKM/5GvqtoFh/3OHB+79ejgHSMwXiEL6W7VRc//yBW?=
 =?us-ascii?Q?a73K53xojWDtVQXXnZu1C+Cf2hIWF52dMqd515hVMRC5aARw7Nj7k7pc9oIu?=
 =?us-ascii?Q?zI4h8xtQTKFIQvrxckBLhC0tNv07YG74Wu/PGhfiNsR5IF58BMAwVk+mBEb9?=
 =?us-ascii?Q?RWgn735ETZMDSjNiHlakV9shrJjCDPF6QVnIFhgUSJjgP2jOHHpjfn6osozV?=
 =?us-ascii?Q?7x+nuahaO5dqs/XHJGROYlzoqz0+Ap0lUPSRZoxeMu1ucJny3zVawl4znFfF?=
 =?us-ascii?Q?+B++RvHnKaePFUcsXObXwmucLiDwjtowJrMqUOOlZ6jioDpE8AHgqvBUJW6o?=
 =?us-ascii?Q?2SiwvFlRKgfPHuZbHZXoofLtURW13p3hoUT1fD53M+k2KIiGju9F6mnPKMjO?=
 =?us-ascii?Q?N+XrE0HdGw5gvTmGiNxxR2Ob1mnj7LKpZow2muhQ1PJSqx/+O/85cU5lB07t?=
 =?us-ascii?Q?UBFVAIZMZJOQGZRQpeKNDrn3k1s7U6gDS39yOcTa1eQSqj5UyxCA09JdpTtj?=
 =?us-ascii?Q?qtC1qMPnMiWfPVMBGAD2E7csaGOdT165JOD7uxyaMcLiODoujBzn2Pstk4DR?=
 =?us-ascii?Q?AebL6FYnGGBf0g/BZUOzTjx0SShbbt62XnP2Z+jW33eX7xW1P8jPkuN90Y3T?=
 =?us-ascii?Q?klr5nkZnaLCQeEXq7Eqy0x4oXwZuvwSifce+l+rStV+mBIKQqLbtYdQRzbgV?=
 =?us-ascii?Q?0RhSEz25BlPeHVGDJkXjlhgl7VMF4P1sCmBXSqREJC9G3TddLh9YRiVWGH4l?=
 =?us-ascii?Q?srLjTopWa6hQB8HUMNWjfuzzLrTAgvss/02sPPBw2MY8e/PAxyrTuSEBsMV2?=
 =?us-ascii?Q?Tr0=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5c147c7-00f2-4781-c3c3-08dd37505832
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2025 23:40:37.6288
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP123MB4166

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


