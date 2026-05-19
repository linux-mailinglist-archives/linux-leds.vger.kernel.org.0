Return-Path: <linux-leds+bounces-8209-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2LHSILqHDGo1iwUAu9opvQ
	(envelope-from <linux-leds+bounces-8209-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 19 May 2026 17:54:34 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 21959581CC9
	for <lists+linux-leds@lfdr.de>; Tue, 19 May 2026 17:54:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5B7A830779C6
	for <lists+linux-leds@lfdr.de>; Tue, 19 May 2026 15:22:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4B343EA957;
	Tue, 19 May 2026 15:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Xu9JdgiK"
X-Original-To: linux-leds@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013059.outbound.protection.outlook.com [40.107.159.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D98C3EA948;
	Tue, 19 May 2026 15:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779204141; cv=fail; b=IwmLpB7Jn9Yz4OY6vwIfjtATFWqDmeglH4cH/neP0fQtrVKz3VY3W6gQyyDlrL07Zvvxfco9Zk0LeAlTPsjUfZDxc4ENopikJzkH+PuhKZV/dpzm/HpXshePVZMG5KF5qDOCJnGeOLEyb56ue4QLX3htrZVesZ8V2O81Zhy0Z+U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779204141; c=relaxed/simple;
	bh=O2CD5QjwjQ0DDdj+Ueg9zJD3/viOWbVgm85EnXxFyOw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YJHWMv3PFpYGKcKl6jkWtSZF9kftU2l8pN5bIRaDYzn3uZYcrnmy+Q0OZ7NtSIqI9i3JAGfU7h4OE+E2Kx1bFqMzS5ZpaAieLiSP25468naPZgf0M67/NllpNZrPl1/J3oQ2fNORGYW8SzPVsIwWM7jS8mkcPvbDZb+b/MI4mn8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Xu9JdgiK; arc=fail smtp.client-ip=40.107.159.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LN3LQTvu14FCbhlYoGeJZEkR/v84UJpaZ59wuOtN9TmiI8FVeaAm6x0BsOI83Vvi8dMrLkhCZ8cJufVsQOR33Riw6mU5fkGgyv9eHYkc96Cgwc3gLzbL6bVA3DD1UsrL2hfbXL1reL1pVoTkF1dtfuKb4eFjwLeIyEIQgU38G4S1x5YanKRKRVl37++vkQMughIj6qd2R/vXLmG2NgtHoSs/Qnq3xYsLxfUL/RyDd2RMrb7uXzdbIDa/9FuvxiEmdzd/Fvkedj39UUGmF2o0AWSRvWq8VXFotkTHnuHsInvwkTAdH4WCnNWNSXyMY6yHLTqj7KkMhpwcW93z/3F8kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N4XCGrrXjQqg8YuImuqKz2THBt+Kl+10S20qTfl+JZY=;
 b=AauGLQZhVuU9EXgk+OMMOK+QTY//Wz3Fjj4NC+0xSx8MrmODiQi7LoXobJ3KIOE/LgwEksyemrQU3mq4wgHuPyDtL4lT6sY+gLGmaZ1MhyZ+qA/pScxVCGaTlJfum0/v9VPi+XAwtAvJziVXh35E9FXG5J5BEjMxSxqtFQWY6GX639XGpzufveTkuZ902b0UQQlVKdKeufP4JBp2KzVDQMmnRKfY2zVdgBJdkoZo+qKg4DyW67gyvbdrppM7exFVL9ZWqEVUvo/c2O9LjB/0CPOj1ksH+seRpHporSMwJSA2XK8PrDzFSH5GvSB2NSI2gWs4Fm+1vPSM6gmHi5FncQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N4XCGrrXjQqg8YuImuqKz2THBt+Kl+10S20qTfl+JZY=;
 b=Xu9JdgiKPC7a1uBS2UcaYQTS/nUcDc+AZwVBM+cUXvhOE9mH0rxkd3n5LtcpheBB3QViXjhtP1s9mFWbjuG+4jrAc1FVYJWPWD3/dWQW9HWus8rPOF50aTM1nY8uQ5WPtgy9hGcXDcG0hnnd5a3i1dvJxx6G8jGlx4p90HOJRM0kET8lPsonKQvSdQ1LopcWiOpkMOwu9Z9LBRxKiXUdwn24sv0bxUKuvXCyoRnmpITR0NoBCn/evj44kk3A8llaqBEzMDbdktCYcehHko07zhoclapChjnECkmQYUn9IobjzbFQbk2sZDtzOdive3O/bdDAuEDN73e+8DDeWwYaVg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM9PR04MB7618.eurprd04.prod.outlook.com (2603:10a6:20b:2dc::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Tue, 19 May
 2026 15:22:16 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0025.023; Tue, 19 May 2026
 15:22:16 +0000
From: Frank.Li@oss.nxp.com
To: Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Maud Spierings <maudspierings@gocontroll.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: (subset) [PATCH v8 0/4] backlight: add new max25014 backlight driver
Date: Tue, 19 May 2026 11:22:08 -0400
Message-ID: <177920411775.2493788.16026675003480715688.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260407-max25014-v8-0-14eac7ed673a@gocontroll.com>
References: <20260407-max25014-v8-0-14eac7ed673a@gocontroll.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH0P220CA0022.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:d3::21) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM9PR04MB7618:EE_
X-MS-Office365-Filtering-Correlation-Id: b97b2140-4ba3-4dc0-5a93-08deb5ba68a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|366016|376014|7416014|22082099003|18002099003|56012099003|11063799006|921020;
X-Microsoft-Antispam-Message-Info:
	ycoqj1wxUpEjZt9JljCoRRcsPsjp+I1MV25wOdlQ14AUWBJJmZJFMKCSba2b8++kYbpYmEy8Ilpdfy6fPPtE66HuPnYDHT08PUlB92jhbIJQQ48+fPSNs71/BU3mGXzh/6wHw4d7hl2tCon4YqXIlVTiyooZvX80+lBjPqs79tyHuE9nl5j5c71yUI+1J0gasSAOif5hLJaBIEpWIEOjK9Xu65U/KnlQ3mTsrzKJbMzuDOl6F0wRSNAn9yn19p9pEp9HHnkASlHLKcqQxrUyU5GTKgjfIcBPpK7jB6vdmW34IuWIntqw8sbLk1VX9WF46GqMH5qSrJ+DqeYR2sjAJAGMr94nJ4ySCSJsgWvUaJ9++9E98tF7XKda8aWHvq/kmu8kywNtgQo0De7EmHwNd3wkZZA+LM8FgAPc09mH1T208qUmq05DuY2XnFQP1IL+h5UOVvv9Xw1j1+8Q3r8krSvJ2H0FbHnfDF5F9ISbF1nh5TeM85ih1Je1ZDwpcx6APy4Ms6i1vmB7AMTYhHTQuIuWJi6edsmno5WkKcXXs7Cw5PxsgwkI3fENbGByfRWtaFoZNrlgqTKoIZ2JQ+GOtpCuFOEic9eMNIe+yPuxQWqMv0JAWnevt/tQDqwGuddvrcGGxJN0Qe6ArlIp0XJGhJD/eYegvKxhMRUbY1OA3UGpnIVOl25u3cOUxFkPDW6n1N0dmyKWhTx0fhtMl0X2Y1kc4PigrULJUW4a+UHU4Hg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(376014)(7416014)(22082099003)(18002099003)(56012099003)(11063799006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eUZVUzZ4OVlPQkRLNG1KQ2FpWTM1ZHdWblRva1ovK2tjREtwWFV4b3NVMk9S?=
 =?utf-8?B?S09GQk9jZnRTN25rczg0RnkzSFBJYlVacEw5NTMvbElXWjN6Tmp2bnh6cS9v?=
 =?utf-8?B?ZE52VjlKQ1BRb3dSQ256bWJ2TmpJSWVwYURxY2RoYStad3VwZzRRUThUWisy?=
 =?utf-8?B?RTJxU2lsOXRWSW5FZGxmWi9aYW9BUC9rZkVTZkZDb0duYjRLcDlCRVhFL1V3?=
 =?utf-8?B?ZzhjL3VJTGFIb2dqUlF1LzdHbzYxNFQrb0RqVC9Ucm95RVBjUTJ6YXh6UjNn?=
 =?utf-8?B?a0hkQXUrWVgzbGJtMkxkcGQxZzVGTXpnR1JwTVVCRGx6VVFiMWZoQThhTkc1?=
 =?utf-8?B?TmZaUzhnamt4NVRER2xQMWo0b0NNQ0lsdTNzeXcxa2NWQWxLWjRxU25PZXlQ?=
 =?utf-8?B?c3VJTS92U0ljYXVYaHQycVprampWNTBEM2gzOFhHMlBSVG9EWDlSd2tyQTNJ?=
 =?utf-8?B?b3pnV2cyT09jdWkxU0xHV2JnWlNkdFdSYkNOZHkrcW90eE9tYjQvV2liSU9U?=
 =?utf-8?B?Y215VGtFTHg1OWJsZFhOMVNYckdkUGVlL2VQNzlLU1paZ3dVSFRCSDBlMzdw?=
 =?utf-8?B?bjRxWDNuaHJrRnhnaVZlNTlHYTRJYUkvbXpWNTVoYW9oRDc5M3RNZ1JEM3Zu?=
 =?utf-8?B?Z042YXB5UHhzcmpPR2tUV0NoZTJhM1AxQzMvL1dtZUJHdGlTbCt2dmFEdlR1?=
 =?utf-8?B?amNCaHJWUXlBVDEwTEhnZnQrTlVtY2UyOStqbFRXc1VETW5sMU5DdHBQb1Uz?=
 =?utf-8?B?eE4zZU5TendGaGZiUUw3VTVwaGRoSEJsSUZSczNaL1RFMXd0L3BaS2JMc0Fa?=
 =?utf-8?B?RSttSTFBemJNbkFDMkt5eURUaGxhRDl6OThITUlmeW55Um9HbWQzSFk5eUsy?=
 =?utf-8?B?RFkzTE1JbkZBaFp1MDNDUzhDSFRjTlJkWEppSHllanZ2dklHeHFMQ3k0R3dB?=
 =?utf-8?B?aUlWbmRTWEFrckxZQjllUnpqQWlmdkFjNkxBRUY2bjhJMVVIUUlTeFZ0R0VG?=
 =?utf-8?B?bnNHbnZRL0pwM2wwOTY2aGhhTFhKYkNKSXB5UVB5M090a3BsOU9xdUVPVCty?=
 =?utf-8?B?dUNxald4L0hpaUgxekN3a0VLRFV0TlFvZVJBMUQ2anJuS3pwZDRtaExwZ1Bv?=
 =?utf-8?B?STRSNzNES2xyRlBMbURBS3dQdHMzbzZXZ1ljMldxUU1MdTVBK1R6bFV1ME15?=
 =?utf-8?B?UWpBaEkwMjJubkxhZHpwRzY3K1dVWHpLYnlJOXJ5NFRzSzJzWmZuaUJWcVVW?=
 =?utf-8?B?Z1pzbVBibFNZK1lGWWEvMVlPSHVPcCt4c29jMGpUZURTMCtnM1VLTHF0bHZJ?=
 =?utf-8?B?Tyt5WDJpVlJlN0VDY0dvTHQzd3ZVVGE1a290VHVzRkY4Qm04R1E5U3U4QVQz?=
 =?utf-8?B?K3dnZ0U3N2lIbVBNMk5NNlRLclNnbXFCazZQYUtyaUtrb29qT3hxaW9CZDVo?=
 =?utf-8?B?TGRhOWMwZkNydklxMjg3SVV0SmJZWFRKdk9MckVsU1FCcUtQVFNzcEpwVndV?=
 =?utf-8?B?NUZjUkJCWG90VWRBZGFtWEFEWlF0bkxJanBFcXlqdFViWkY3alFYYkR0UWRN?=
 =?utf-8?B?Q0cvNEozS3V4QUJnZkl0Ynh2SDJkWkpZVnR4aXhaM2xGakE3em15RjJkWFJ0?=
 =?utf-8?B?V0tuWG1wbkVNN2Y5Zi9UU1BHQ1lOWS9nV3hTb0hOSk5TeFZHT2hKUmcwcU1B?=
 =?utf-8?B?WXE5VTNNWXhmTERiK3NWOEdtYk9wSTFIVkFJRmhtenp1S0h1MEFiQXY5UFEv?=
 =?utf-8?B?UlRoZEVjbW5mdnd0b1R6Zm15cGl6U2lwaVpES2o5cXRMakZxS0kxdktJanEx?=
 =?utf-8?B?OXJOdUg3dHd0K0JlOEVSQi9tVXBVdmp2M054QStLaCtMMVRXdDAzaWxLamtO?=
 =?utf-8?B?bEp3L1RVT0VsSWNPYWEwOUdQaTIrd1VkNy9EbkptdDkzbFRTdGhmUHBkS3Jj?=
 =?utf-8?B?THVKa1EzV3FCMUZKc2gxdURrc0VmK0U1UnpQcHJkYXlQY1h5c05qT2FGUWcx?=
 =?utf-8?B?YXpjSFNaa2RVVVlzK1FTOWZhUXpBM2RBbUczUGRnUXpFNnRPL1ViUXIzQ25K?=
 =?utf-8?B?NlRrWU5sZnBMVXZMaUY5UDJoeFd3MGZxUlZJKzd4SjA1d1dMdlBCeU5CQkZB?=
 =?utf-8?B?UU9xOEdFQzhNSjN5U2F3NzBOUFBHbENLWXFzdTdhSytXWUFCdi9mNUtVSWFY?=
 =?utf-8?B?bjZwLy9FbGN3bStJQ1loWkFMMWRUSUEzUHlmZFpjMDNHYjd6WEwzYU9qVzN4?=
 =?utf-8?B?Y3ZrYndMK21BK1cyMUxpS013eVJocjN5Q0RqR2g3Mlpyc3oyc0N1SWoxeE9H?=
 =?utf-8?B?Ni9LVmNUWVRuV2hTVWNLd1ErVE9MQ0JzckNSc3BoVENhMk04UmVYem9Bci9S?=
 =?utf-8?Q?3hoUYrYxccMJw32zYCpgzwP5Ho/PUps6ag46l?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b97b2140-4ba3-4dc0-5a93-08deb5ba68a4
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 15:22:15.9154
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zgj5tSa9MWblnYRe4LsVF7dP+NI6Cq5lWF3dAxFWriEkNT9UzQE/yx3uf/BOo3RohKiL0oauY3a5x7DfRdkPTD2003IIcCy9uO50Npe6Qt7JZO4+1CwJao9ZC/A5GyK5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7618
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,gmx.de,pengutronix.de,gocontroll.com];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-8209-lists,linux-leds=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@oss.nxp.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[NXP1.onmicrosoft.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,nxp.com:email]
X-Rspamd-Queue-Id: 21959581CC9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Frank Li <Frank.Li@nxp.com>


On Tue, 07 Apr 2026 16:41:41 +0200, Maud Spierings wrote:
> The Maxim MAX25014 is an automotive grade backlight driver IC. Its
> datasheet can be found at [1].
> 
> With its integrated boost controller, it can power 4 channels (led
> strings) and has a number of different modes using pwm and or i2c.
> Currently implemented is only i2c control.
> 
> [...]

Applied, thanks!

[3/4] arm64: dts: freescale: moduline-display-av101hdt-a10: add backlight
      commit: 10fd5ba8fae66d60c65ec4bdb51fbbe5e34d9d83
[4/4] arm64: dts: freescale: moduline-display-av123z7m-n17: add backlight
      commit: 159746425710c94befb317132816f5eece4ea25d

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

