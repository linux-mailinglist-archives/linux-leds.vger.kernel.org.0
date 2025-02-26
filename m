Return-Path: <linux-leds+bounces-4102-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 071A2A46768
	for <lists+linux-leds@lfdr.de>; Wed, 26 Feb 2025 18:07:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BEFEF3A5123
	for <lists+linux-leds@lfdr.de>; Wed, 26 Feb 2025 17:07:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29993221DA1;
	Wed, 26 Feb 2025 17:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="ZZBj+Msa"
X-Original-To: linux-leds@vger.kernel.org
Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazolkn19011031.outbound.protection.outlook.com [52.103.38.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B482206B6;
	Wed, 26 Feb 2025 17:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.38.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740589621; cv=fail; b=mpf3KFncwmMyMFPgKk1bDK56dZGoRufIbd4XdVP3MonBhRZ8/2mlE3HG682HfuPkJr0CcXkmTeXIwDi98mM7tT5+YtAxMBAR0hderAVBuv1p5mDNEGLueY1aKss/S7fU8bS8ugHlyih2JdYqYrtZ1cutDREkPpoEj4vuDuO5iPY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740589621; c=relaxed/simple;
	bh=lglBZu2z6/yDzUwKJSJ/ugixjS96HCeKUOGNVxI+vc8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lyGnntso7acUlQxUmTLAZffEHNBiexoMlGh2Ucm1n8IYwSG3/ASRKk40YfySiF35cBzqlolrUrvh61GsONmDF0h8lxwUA1VGsu9AoCKPfCMk0sVa7eSpK3f7sf0jbepAQ9buJKTEgPwS4S5nZAsnImDbkHX1KOewpXlqqzJ2Ruo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=ZZBj+Msa; arc=fail smtp.client-ip=52.103.38.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hBMSE0CvqZV56XphDT+oXgLRGDWngwiNjbfRme1uLcXbQQpTxLe35UUz35cCsSVQDkjYXyYT/04eu13zd63g4Cobc+bXdp4ASM0qNcN8heeEVRqPCzTb0iHDok8CyXtb/AcSl0sVnu9fygYr1dTehPtYJDbyxob5x/lm2LdJl4msIR49VsnSAwbbmxz8U+wPRn0zCOnpte3arnlhTb9HEGGDd1d30yRhrgAn6LY61CeKCbI4NK4IITHjztTifZseSjly6g39jPDusgPyyWZnzmr1LMqOGXizU9dOZllH8CxtwMRuh+ANIJZBzcjcD/xMxyebSjOb6rfrGK6yRmIsSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6FqGZgT5fIFbVNTdsVQ2HmeFfN6EenK8dxUuBkA6s+Q=;
 b=E8j0BdfUJPDzH48AjCOSSnSjt+lnwZk37Mb91yudtDmNsYraTZb8f8OFL73DPuqsODVwsvp6uaswKvBm2sn83SKP6jqPRzzdYmUSUFvUSEHXikNIl3P7PejCHwzYcYJWnUV6bTpswdEtSvZhbCmO9RRCkvnmtlwEemY4mhL6q/sFnXIErdGmpYUVm8D/40+TGaquhmhC3+v5xxFSqHu8V738XnAG+MPJgRVMDVWl7g42QA9EPikVHj3vtUYoGZLk4D1bKjzv5piF3EbtGIhZJenJ3ybPmGvwxxZVJrpw8ph6UJYxZ/21wmW/3Lzxd3Hb4qAyatg8sB2DMKDbLHA23Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6FqGZgT5fIFbVNTdsVQ2HmeFfN6EenK8dxUuBkA6s+Q=;
 b=ZZBj+MsaGTGbj1eshpmkyITgJ61xAsGia8BxWMg7w1i33n6sbrXChgiIaA6WI0n5a7YO92YJGFfcy6NsIoYXAq//JobtYXhM5zCttyHH+fBJ6UP9kCLcpmImbxKaBizZEL5JVi52jjfvT/B2yH+PLcrqDGYxWQB8DF0ROryz6tOq0gfhWXSWcZ62+gwU0Nz1lpwGENu9A9gsUhFZW8TUlfPf455trWQOSHoF6uTy0xpRA93nWh0R9azN8tT3p0IPSdGUXWdOoQM3gFLLIvaGwMCmjDL9FX25/h80Iyj3XHjADL0ZqRgQ7Jt7OAaMoIw77u5J6W4E54eDY0AWPgd0aQ==
Received: from CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:160::13)
 by CWLP123MB2803.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:5b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Wed, 26 Feb
 2025 17:06:55 +0000
Received: from CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
 ([fe80::c0fe:9ff5:51fd:3fdb]) by CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
 ([fe80::c0fe:9ff5:51fd:3fdb%5]) with mapi id 15.20.8489.019; Wed, 26 Feb 2025
 17:06:55 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: pavel@ucw.cz,
	lee@kernel.org,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] leds: leds-st1202: initialize hardware before DT node child operations
Date: Wed, 26 Feb 2025 17:06:40 +0000
Message-ID:
 <CWLP123MB54731877A8DC54EDD33F0229C5C22@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <CWLP123MB54739F38EF9CFA057021BC2DC5C22@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM>
References: <CWLP123MB54739F38EF9CFA057021BC2DC5C22@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0159.namprd03.prod.outlook.com
 (2603:10b6:208:32f::34) To CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:160::13)
X-Microsoft-Original-Message-ID:
 <20250226170640.2338617-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB5473:EE_|CWLP123MB2803:EE_
X-MS-Office365-Filtering-Correlation-Id: db0c2ac8-d8b9-4bd4-278d-08dd5687f8cb
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|19110799003|5072599009|461199028|15080799006|8060799006|7092599003|41001999003|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VX6pI64bcCYYd6wuffa/2TwqKFfZbvfIdKmE5b3fvhFDYLfuNziI3cua9101?=
 =?us-ascii?Q?/34QkbyZcJzUW6aW9z05P88H7kYLqGIf5R11H+2lHSW5KQEnNIDqLsfEAoF+?=
 =?us-ascii?Q?KnOJ/EaCuq/GJtVbhllUFNRhGeKWdFWcXQZD0Aqh2WP9mhv71FxJFpPkRAyy?=
 =?us-ascii?Q?EX0OlRfbMtNS5f3eR3NGbiB2NMLT4hM/KizpglvDYJZTtyxg6Z1KgEkF38PY?=
 =?us-ascii?Q?XcfgqclPXi6a+ahBV0QulcrEJ2xNRVD2rfqygd3sOKibRN4Fk+p1/5+XUo6P?=
 =?us-ascii?Q?rXlVLSXzpNNbxyvU8jxUPRcFddpjWqVD89Jrgi42gZJZvPhWZMYxpy2Fc07Q?=
 =?us-ascii?Q?+sIjBMHNErYjH0TzN/8gAwlrkno5x4nhM9LNsqglCOKWBTC0HaTqJfidObMq?=
 =?us-ascii?Q?uGSp0erSaamQZGySc6MXWhXWyGLbGoPhgxF75wxID+a6LPFvjLykdXLQPS57?=
 =?us-ascii?Q?u3PsDpntiagvuuUAWzprb1dA2wIrtBgX/HIZXQ1IoVETj8wSqwrjk709oxG5?=
 =?us-ascii?Q?Zf5c6DapzJWoPh41Iw4cbtJ6KQ9kj1YeOO0ghuU+xdivcoduAwqyWLNYrX93?=
 =?us-ascii?Q?bQ6HQv53SXe8eyaT5F3x8huDvL3vXf9xLcFp0FVZbGB/LArFhWv8GioxaVIY?=
 =?us-ascii?Q?tmlh917OXlmQgLfoM+vGmL23SgN8LJ2yqnYyct75Rdbriw0hS0ySoq7JWxXC?=
 =?us-ascii?Q?+eRLP5fLpXPWCW4vhOAsrIPxTeINwTILkT0tp0TLtP5oxcxCxWz8tyzk9pYz?=
 =?us-ascii?Q?mIYGZ/gvGITjJvX/GI/d6Mxe64oZB+dlJHHotRXDNOD1UcWm3OncOobVXLOR?=
 =?us-ascii?Q?+HpzmlaBfcJPxhGx9Z0j1zjgZR/e0uuY1x9lFoAWSsW2bIXjuc3YwJuzKDQ0?=
 =?us-ascii?Q?6ZAzIg1h46H+L1/nDytcotPnfwyHFLLa/UsG1xD3mjSCwoZb31X2VDjxJVe5?=
 =?us-ascii?Q?meX9ohGz1eFrWqOebXzr6Drk2+fv7v0FDFdBR/yJfhk3tDqfs7Uc1kvjlox/?=
 =?us-ascii?Q?uGs+b5qKNDkeuAJ5C+hT/3lxnjpKA1H9AoE06L304gLnLRb5z3tX8sgrfIm9?=
 =?us-ascii?Q?o5kKBOcUxGD/zcCumM/H5OekH827cpP//q6QIrW+FNSuHK8pLmI=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KhDJoW6bRm4Ldmhv4elamB5/DV/i3OeKgTCSDRjwfhOmMldCjO3EhIdsGjoS?=
 =?us-ascii?Q?fD8bTCn7WnGOMDkpjLiSs5RFrzcAqJWfbBywWlDXSCdP7EEp9n2DhrYeCRmc?=
 =?us-ascii?Q?pefIqf56p6YrDvunOnDlEdsOI9ktLNjEnWAAAIcdmS9/e+n/5zsq4ggw6nkU?=
 =?us-ascii?Q?4IoIRc56EWHQ7Tb6B1/onPq4pANckaisYlzH6wwQlUmCOycR0j5QApD4Xm1l?=
 =?us-ascii?Q?h9SPkkLLUdGLJTQBzT5t3est08gDKcKGXAnWO7W/pLemUv8bEtxQBX57mUua?=
 =?us-ascii?Q?2zAouj1b5lEtJ2OzRpnRw7/e69s1Frq0P+MaUXOUrC71/RyxWSQjGgo4mTIx?=
 =?us-ascii?Q?TkMhK9PBnFJ0cx+WrrWxkykGM/Iz8jLhFQr08kLWKslPjkvRoEP+I4vMIrYc?=
 =?us-ascii?Q?0YeLaIs6/mHHugbVKUPXmxljrTv+32kzt59WyYK8qnihogAGX7TTuz1cpK+Z?=
 =?us-ascii?Q?USF/l1Yi1+xfFeCiZR4680LPXLlN6phmsa+Bx9ZZwa8WbNGeyqa8hBKspEMx?=
 =?us-ascii?Q?y7rHCJ4fV3ctrTCqar/UfQYOM5R8TPRb5kh9PnCyS2pTmIuxn0NO47UiMUIW?=
 =?us-ascii?Q?5tTG1TMoPmmsFsqUX+nGetsWCGjVYX1FOQNkXGoThgBW2g9ZS1NBeZknaELQ?=
 =?us-ascii?Q?iB3LZ+z871fGqWNukdvIAr1De4v7ZWp0985iQN+Dff+7Qms3gxZz4WDvW3j9?=
 =?us-ascii?Q?BNsukdr1SxQavdylgt6Rk8BtlWP0cSn6m5XWBuRRHHXSBLIoI0q2h0IpsPo/?=
 =?us-ascii?Q?AYp2+K+TM+GcXlJxbNIW9PPzo63pc9LAStMTEZtOMbq5pK8ZXTVCXHEVKgPp?=
 =?us-ascii?Q?tLCYH3mDIMGgSSk3nb5f4i5nStyhaZHOYfdJGoJ9hmAddHoY2KYpTYokNywC?=
 =?us-ascii?Q?s0sCKohU+pjEG5qVUXfWSPAjxdtNmVGlDBAvSr4ZN7VH5OvlhxLSiDNedioL?=
 =?us-ascii?Q?vBV48Hs1JaJmTXk3jfjEJoX0k4gw/ZhdVaLhyTZJ4VXGawQzWyTtWUu4zMDH?=
 =?us-ascii?Q?YD7Ha+dUu7odvMBp19wM5xVpoKCGHEwUK3nraG70rXYJUmoa3wMdT396Zo/7?=
 =?us-ascii?Q?OdKFrdfumPakYJG68xl01s70VNHAIKCjy2NmmM6XfJyaC2UBIApaolBW4VK/?=
 =?us-ascii?Q?wq0qR4IC/y7U1CwX3uFXkBo88/evpHOnnN6ZHaxyjB59A67OgIGsBEfYALfl?=
 =?us-ascii?Q?OWO98O2G6QxlDgqUG5DvN83bVg9YYxLYcQbMJapalhGBLqILBiRSY1mQOvkw?=
 =?us-ascii?Q?Ryb0Id1EPIPIKFeFFya9IimcIFGy/buZdeui8r2PIdAOLBcHUD/ZxY48FXfv?=
 =?us-ascii?Q?V7s=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db0c2ac8-d8b9-4bd4-278d-08dd5687f8cb
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 17:06:55.5907
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP123MB2803

Arguably, there are more chances of errors occurring during the
initialization of the hardware, so this should complete successfully
before the devicetree node's children are initialized.

st1202_dt_init() fills the led_classdev struct.

st1202_setup() initializes the hardware. Specifically, resets the chip,
enables its phase-shift delay feature, enables the device and disables all
the LEDs channels. All that writing to registers, with no input from
st1202_dt_init().

Real-world testing corroborates that calling st1202_setup() before
st1202_dt_init() doesn't cause any issue during initialization.

Switch the order of st1202_dt_init() and st1202_setup() to ensure the
hardware is correctly initialized before the led_classdev struct is
filled.

Signed-off-by: Manuel Fombuena <fombuena@outlook.com>
---
 drivers/leds/leds-st1202.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
index 9f275f7fb159..e7dce8c26bde 100644
--- a/drivers/leds/leds-st1202.c
+++ b/drivers/leds/leds-st1202.c
@@ -349,11 +349,11 @@ static int st1202_probe(struct i2c_client *client)
 		return ret;
 	chip->client = client;
 
-	ret = st1202_dt_init(chip);
+	ret = st1202_setup(chip);
 	if (ret < 0)
 		return ret;
 
-	ret = st1202_setup(chip);
+	ret = st1202_dt_init(chip);
 	if (ret < 0)
 		return ret;
 
-- 
2.48.1


