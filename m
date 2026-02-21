Return-Path: <linux-leds+bounces-6972-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id RsrlBq+CmWk9UgMAu9opvQ
	(envelope-from <linux-leds+bounces-6972-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sat, 21 Feb 2026 11:02:23 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A61B16C923
	for <lists+linux-leds@lfdr.de>; Sat, 21 Feb 2026 11:02:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7522E30028E4
	for <lists+linux-leds@lfdr.de>; Sat, 21 Feb 2026 10:02:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94FBF2D6E62;
	Sat, 21 Feb 2026 10:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="lx8496E3"
X-Original-To: linux-leds@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazolkn19010018.outbound.protection.outlook.com [52.103.43.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005FE4A32;
	Sat, 21 Feb 2026 10:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.43.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771668132; cv=fail; b=hTeSK8HwETmiICHtZoJ8v6bNU9XuQzGuXkyDQ0pEftjzwko1f0gTw+AmF/mHF7qrc7ccH28exD+trWSoKrPOz1QvblnKGnsdDPbI3ft/1uNqh9sXZNz1RveMQfDsKS7waXKJSQFSYpYXJz7Ntw1+U5ZWLF4EBvO7l90MLZpkJPk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771668132; c=relaxed/simple;
	bh=+zaA/vDqB7g/YgGjG0lodTe2NyxaOfbJ71OEU0aFtYU=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=i7GiTcFh0E+LjX4W2tmki8D7Wyl/62KWqIjdunQVrrxRfI2rALWMjtlTRXRodKF/BJh5Dcs3l0NJgmqiR97oawygpmT7xsTQF1x7Lpf31ADGYxLpuhHfKJ7pHiQ0t24uKF6sEDiGsZG7/vjhPMNhP+gdeD/6Owamgygu8Erjwrc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=lx8496E3; arc=fail smtp.client-ip=52.103.43.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EGoMGTFB/Q92f+QgTST27/RPRs30ObTA3FDM1cZ/ZZTKXnP3sRy4H5j+enwJ4tpYyOl0otKDnN0CD/sD6Jj5kae4SPobyp9tdCqg+GEKjICP42utu6scST3T1T5OLX9phS740KjweXSj/ZoLawYQvSdjkJofjYAGhAkdOe/BD3ncWxGwNOF6NqyyYzmHhY1fW/CmnHlNq6YtIbxyw/luZK2CU1pFdaERBGsPs9j/k4trPA9bIJq95AJ3eGCPMv1Y1s0Fcg29JgipcRBznQw1MSSVpt2HW+yZ5NsV1305LeGi4s+uOwYjsB9cBcqqjyuM+wpbglRms3ZYrpqIAJqMyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SGzY6AdKdNuqLN4TbU1YvR1d0/6TxLicAKSU9jSPUBE=;
 b=I4Fq7sDVvRQ4kmweGqnDD/KpLBKOTdLzI+Ha/Y9D3+y88XrpbgXQjUobaid8paO0P5rvvMpSPp5e1SobZa2jCamYtqPMrlY9+RNnbtO9DwPRRLF/m4jSqe3IlC2if+/jq/0b0cB5lR81BlSx1sugTKbBmxrfK1H+r2csJTcN2P/fSxKKb3F42PE+ZP5hPZyccleZ6HR5h5RxfS0raILO86SSSSTVzAdyTAT79yrWqbGZnKTAK4QeRlCXPLZp/+QhpqQiOJ7SSRzUl9xtOEt1kkU1fXxSJFXb6h6v3pASQ6F8jcuGZQqTVeRhSMQHxqK/8ztK8c8RVFX/umizHQ44OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SGzY6AdKdNuqLN4TbU1YvR1d0/6TxLicAKSU9jSPUBE=;
 b=lx8496E3gfETZFjGjoO249f4d5Paryr19dgDiG2Xdd1D1jReb1wj1c5chQVi4SbTh7u0eySCU7H3swgF46VmFWmkVqRahNm5OxvItZF6az1nBVN5Ue82cOVbOVgalzbXuI0GUAV1Tv9k9CX058+TQVtagZOaRlhbANNh0OptgY5XukuaOHvxwJ1sgRyrKHiAbgsH48UpZLlaGJ3SyNiGRWzJpZRBjBB/AnaUj9YSZmXhQYodmfYpILs/rl9z73n7XwwZLIkz6PkcyQK8/AmIV0o7m+H9qPIgzlG6z4dacbyD4xv75Bh9qOC2eEd0n6bzymDmEfqawxMdyJkd15gUkg==
Received: from OS7PR01MB13602.jpnprd01.prod.outlook.com (2603:1096:604:359::9)
 by OSCPR01MB14596.jpnprd01.prod.outlook.com (2603:1096:604:39f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.17; Sat, 21 Feb
 2026 10:02:07 +0000
Received: from OS7PR01MB13602.jpnprd01.prod.outlook.com
 ([fe80::7a94:8782:9191:8d50]) by OS7PR01MB13602.jpnprd01.prod.outlook.com
 ([fe80::7a94:8782:9191:8d50%6]) with mapi id 15.20.9632.017; Sat, 21 Feb 2026
 10:02:07 +0000
From: Shiji Yang <yangshiji66@outlook.com>
To: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Cc: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shiji Yang <yangshiji66@outlook.com>
Subject: [BUG] AB-BA deadlock between net and led-trigger module
Date: Sat, 21 Feb 2026 18:01:46 +0800
Message-ID:
 <OS7PR01MB13602B128BA1AD3FA38B6D1FFBC69A@OS7PR01MB13602.jpnprd01.prod.outlook.com>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0008.apcprd02.prod.outlook.com
 (2603:1096:4:194::12) To OS7PR01MB13602.jpnprd01.prod.outlook.com
 (2603:1096:604:359::9)
X-Microsoft-Original-Message-ID:
 <20260221100146.3997405-1-yangshiji66@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS7PR01MB13602:EE_|OSCPR01MB14596:EE_
X-MS-Office365-Filtering-Correlation-Id: 02f83435-e509-4f53-e579-08de71304555
X-MS-Exchange-SLBlob-MailProps:
	Cq7lScuPrnr9cOglUl1urTSFBsjx1OD0zDwN8URQ2y57DUe0xDcjp8Oi0ZuoB7I3nLaygD0aZzAczO/5jnBWA3/uWTvBdqWvqCLN1IVjI/H/ZSYCRAW3HFO4uaCE1QpzSkvoyLvzcIdYyyqzK2jJNHR+Rq2R5G2BSl4hgVL4OeajbXfh/9NiYaMpuIaaT4LiprFqv7lIiWGOjwEg+edUrhEltcgAMf06DVX3q/0qG28FwvDg4JndeM6k51s6y5SXpYOQtYvBez3WzsMjLAd27s2LgbzjAUVpXA4pNRGfsQz154LY8ubJJnR69UhD1UJJY8ylIttdBv7DulUmPfxkaCwO4hFIuN3gTfJRUmKJLkBHBuROM9Js/2KAqqNVlyA/hvfkOIQ42SPOFY9ANXDW+AyOcl61hp89ppJ9M1qyZdkbLiB7QG2Y4e7+QQ2FA2w0VNmIlxBkTo2zoIjOaAvk+js7cK7mZDlDqfdfecb8RPiuu3W/jeYrMFB6K9bs3qm2sC3nBw+YbviD0RhO1MH9AOWtvCIAycEVdHdrxD+jA/Cut76cTHX1B5zQ8rrniIKTruO90JxXrKoPBd8pJCQnsfe6UTa9AO4E62T+Sdls8nI7gytxgBFR1FDmVyM2pIqECA4r8kpyxuOQe5uV+F7nIHWBjYdEMnCOzCY5zfSa2jcjxYgfSxcWUHjI1MweI9vTnlcemb/kIAvNsAXw7m1lrpckpexNZ23MyZP1VN33FN2X4AAmfFn27qLiGLyayXpyP+rE3PW2guQ=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|461199028|15080799012|8060799015|19110799012|41001999006|23021999003|10035399007|440099028|3412199025|40105399003|52005399003|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bPG++w7LbQ4Z/O2WwKp0MV4NJk8PbyBVB60WELC9X9tPmGQdAj1KPbLIBJSt?=
 =?us-ascii?Q?hltQmfx40ju9HNTgMQqUS3m1P6AlOmAszZULoZS/Kvnihh5m6Y258SCtaDYq?=
 =?us-ascii?Q?1TnnWgLjM8UF2JoFC65hLAk+QJ587YhuY6wAJnxG6/PaW5eYc5T5jvtxYs12?=
 =?us-ascii?Q?r0xa4VWPBJI5FJYQdrFpGgyDlIOA0tFCOoMqpRchqugIh9XxsF+uoTf47zNT?=
 =?us-ascii?Q?ha3g5PK9uaMBMDXT9Htd3WOfds+K980mg5OW3y9vllJagpFLluZnbZ8YK3s0?=
 =?us-ascii?Q?tSsclgTosuim6k+MOSdx1ywZ+NeOHPxOxvfHYCeMazg1LyFedpSdAu1sy0MW?=
 =?us-ascii?Q?+Ai4jXoayrDHUGf5y0a6fZc3QYVusXVu6Bc1LFPOVTdP9j5HpzW1k29NS1qq?=
 =?us-ascii?Q?5pFnPb/ZkucyM0XebknJQ02dg2hht47zZW6CNfzmA/axaksB1jA9QeED3qla?=
 =?us-ascii?Q?Ru0/nJstuD07Ho5gsPC62Fdod5Gz/jgXHZctQTEsfCNtGc6BCi+qpaQra2eh?=
 =?us-ascii?Q?vzI0Zqbl7a4I/atxO7y9/0QziUBuhPzUmm/Jwy3YZGOkLyWZWTjiedcvKIdy?=
 =?us-ascii?Q?GLEbg85idlU8w3gPq7DQL8ceOzmDoZNcNZpCBURLH48vis0jGLU56OUkLdHz?=
 =?us-ascii?Q?g/vciyGZRlfQHXh9e6wSLMdOJ2EW8F7nTK+FbbY07e2WEVD3lPjCnqR5qgbh?=
 =?us-ascii?Q?kga2AfwajPburjDbLvmTi3DGkitVlw3AcQT6aGh3ULTYXAXoXJFQlCmq0OTf?=
 =?us-ascii?Q?jrvjvUFEnAiYpSr4hYVM9u1oNKsJDOCNgEuvNjkNQrEDE3EwyoDGnLPI7I0J?=
 =?us-ascii?Q?h6wajaMI+Gk0NMYuZI2zMPtgtSWzv32hKUm+/hvTV3qgD+K+vki21/IvWRuR?=
 =?us-ascii?Q?lERKowJw7i43UfJ4yyUVBIgUiI1KOVl6N5XUVZ7wuVDA9Bjwq0buUK4of7U9?=
 =?us-ascii?Q?MT4ZYwzdGsRangFH5jh8B8VMyWVfvWThImv7UKPwBPv4UF4geRtdbJofuyNq?=
 =?us-ascii?Q?2/O5bMzncLED9bSfXoQPbTAIqk6jK2kJAHNNuoAyq3YJdC1rBQoxFv35iNiS?=
 =?us-ascii?Q?0cxksqIuX3qroEIIit7D6Q0fxDsoH8AywKXuJ0ag8iVl1eYihtyiaK8ZIrdO?=
 =?us-ascii?Q?8NbE90Tsu0olJ4fUkvB+mCnN7jS3ywfTI+5VJYyAwAHGoIrF6NxPmT5RhF4m?=
 =?us-ascii?Q?NMdXUB+7ItXvnOYCozwnyqyLuZjwn/xNntnoOFlATOk4G7+RFMH8QFPpjbof?=
 =?us-ascii?Q?H9elOFKQ0TJqlsgLybplIGKohfQuPBh27BtVI2SKKS8yrwSYSRtA/qa7r40p?=
 =?us-ascii?Q?MKWV4/CYLab+8NMsU0FcMVDw?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KkzTMY1sBdUyhLYZQbhn+HTOnmfG1kus9cC07yhmivLZtsZd5/IwK2JBAm1w?=
 =?us-ascii?Q?Iz1zPPqeTH9NKHYzMkfub1Hy/xvycu29YWRY4rpK+0ndQhz68K9hhfPCdenp?=
 =?us-ascii?Q?+eR4OLFxe9wHouMZwYGxwN6U4lojmIWUtBYrleNMl3JnDDrcDKIY9bTNlpRF?=
 =?us-ascii?Q?otzcRCUmxugBCygTtxD6DKr/huXEdClaOD1rRPlxZeZA4h/7iyzC3ca7hQph?=
 =?us-ascii?Q?EC2oGRgePjcywvnfxH3hTg2d/mxCaSN4xltoJ+Bux65UuI08FcX7AuRPqKrt?=
 =?us-ascii?Q?3WbQmDVLVOldfINRo6df7+b4JfUPrpGcJdwgr/b9OhCCCZ8fTizbD1d8Er4q?=
 =?us-ascii?Q?gdPAKS3W1q4aJHV92XoX/1v2JYc0lo0IH0Y2Ng4CTnd+haE3KUL2Y8GMiS7M?=
 =?us-ascii?Q?ZhoDUeThFEPSoffxf1XjMekpxslx3AtJbNEyUEkWuFdpRqABT3AACk1BdCwM?=
 =?us-ascii?Q?XJKAhLPvGV2evZZoNQcWIFX/hj7rpSHD+fMEfECWJOlaBnpOj5R/7DELUCmq?=
 =?us-ascii?Q?FYx7aJWxPvKXO6PsGj0Uh5zSFQElX5fKklqkQViWkCI83II79YPvmaHClr31?=
 =?us-ascii?Q?UP4yTrBLeRXPERlzdz3nL+AwnXIsKFMzYESyuWCjO+NW+zW2XpoZwy7yuu/A?=
 =?us-ascii?Q?kenMIvVaP4zZOfuxyzw2haJs11eG8d3EE0+T3qRy4sxZhFUuk1j3kSwkWjUD?=
 =?us-ascii?Q?6mxlBUPmAtHRtZQUSSCUxosZvic6V2yFs5m6ii6N6OE0mOqlbqhcNiAGp19t?=
 =?us-ascii?Q?Eg2dIo9QoLk+XchU1wE+pXmLmKdi6TaGF2hxHqFtECUlze5PZbfbDkk9IQxe?=
 =?us-ascii?Q?mJrFaDDdaTLfCg4yUbjde+lhSTCq4QbVVgXRBlPINcIv+QGyCh4i8kB1sm6y?=
 =?us-ascii?Q?Y0mT44NW3DlFf9eupViU4otjCAWTbPPKuoRyJslc2CfQCzft/jT8XFJAaYVV?=
 =?us-ascii?Q?cp+ByDRilKTYigfqfIXepq3D3/ATZG1ygWUN5oMUS6TJTnR7YgCJ8NnyTpiC?=
 =?us-ascii?Q?xadPSMGd80h0kPq8GXfhTCjCaB8Loc1jFMkfTr+DV23kAKzz1lMnyiguzSkg?=
 =?us-ascii?Q?c2PZ38jUHWQ3D8SnqF8NCcKvUoMC6hikrL9krTDxCcqz7/muCtPeLk+KBIKS?=
 =?us-ascii?Q?lBY4I85Xc1PddFEw00+ux3YALTDeWWT+FM4nAx7l6HVubNe6vh5pXyTk45j7?=
 =?us-ascii?Q?TWZVfQpcEqPHqjozNv7dGhvYKqEXgDLsmpq5vbzwVNyLo15os52CcWtctL98?=
 =?us-ascii?Q?70pFPTV6qsyfKHbrs1W5BJyURLX72aN+bXNfnYZgSfINVD6U+rs7LcuZaYFD?=
 =?us-ascii?Q?AXbsM4Uh1Ppi6huUtJOeZL905Mht3YmR1YFPIw0IJuYsSafdGjZ9B2GOuh8F?=
 =?us-ascii?Q?fIGdQs5V9auuWEh2hX3lat+DWMhK?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02f83435-e509-4f53-e579-08de71304555
X-MS-Exchange-CrossTenant-AuthSource: OS7PR01MB13602.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2026 10:02:07.2584
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14596
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,davemloft.net,google.com,redhat.com,outlook.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6972-lists,linux-leds=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[outlook.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FREEMAIL_FROM(0.00)[outlook.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yangshiji66@outlook.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[outlook.com:dkim,OS7PR01MB13602.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Queue-Id: 4A61B16C923
X-Rspamd-Action: no action

The OpenWrt community reports that sometimes devices fail to start[1]
on 5.15 kernel. After further tracking, this is caused by a AB-BA
deadlock which can be reproduced in at least 5.15, 6.6, 6.12 and latest
6.18 LTS kenrel.

Stack tracing on 6.12 kernel:
```
Task1 "netifd" is used to start/restart the network:

[ 1361.967916] task:netifd          state:D stack:0     pid:4743  tgid:4743  ppid:1      flags:0x08100000
[ 1361.977269] Stack : 00000001 00000001 00000006 800bf464 817a0cb0 800b67ac 00000001 83261b20
[ 1361.985668]         83261a54 00000000 83261aac 000007ef 00000000 80c04d74 00000000 00000002
[ 1361.994138]         83aba760 80ce0000 83261af8 00000002 83261af8 80cd0000 00000002 80d8058c
[ 1362.002582]         80cc0000 809bae70 00000002 80d80000 80cd0000 80d80568 00000001 00000000
[ 1362.011033]         809baecc 83261af8 00000002 80d80560 80d80568 809bb11c 809c09c8 806614d0
[ 1362.019484]         ...
[ 1362.021942] Call Trace:
[ 1362.024380] [<809ba6fc>] __schedule+0x504/0xc28
[ 1362.028974] [<809bae70>] schedule+0x50/0x190
[ 1362.033251] [<809bb11c>] schedule_preempt_disabled+0x1c/0x34
[ 1362.038958] [<809c0b94>] rwsem_down_write_slowpath+0x240/0x7f8
[ 1362.044789] [<809c11c0>] down_write+0x74/0x90
[ 1362.049207] [<8054e4b8>] led_trigger_register+0x5c/0x1fc		<-- Trying to get lock "triggers_list_lock" via down_write(&triggers_list_lock);
[ 1362.054536] [<80662830>] phy_led_triggers_register+0xd0/0x234
[ 1362.060329] [<8065e200>] phy_attach_direct+0x33c/0x40c
[ 1362.065489] [<80651fc4>] phylink_fwnode_phy_connect+0x15c/0x23c
[ 1362.071480] [<8066ee18>] mtk_open+0x7c/0xba0
[ 1362.075849] [<806d714c>] __dev_open+0x280/0x2b0
[ 1362.080384] [<806d7668>] __dev_change_flags+0x244/0x24c
[ 1362.085598] [<806d7698>] dev_change_flags+0x28/0x78
[ 1362.090528] [<807150e4>] dev_ioctl+0x4c0/0x654			<-- Hold lock "rtnl_mutex" by calling rtnl_lock();
[ 1362.094985] [<80694360>] sock_ioctl+0x2f4/0x4e0
[ 1362.099567] [<802e9c4c>] sys_ioctl+0x32c/0xd8c
[ 1362.104022] [<80014504>] syscall_common+0x34/0x58


Task2 "led" is used to set the led-trigger "netdev" for a GPIO LED:

[ 1362.110308] task:led             state:D stack:0     pid:4943  tgid:4943  ppid:1      flags:0x08100002
[ 1362.119656] Stack : 809bf818 80ce3ce4 80d47fa8 fffff000 00000000 809bf840 00000001 800bb264
[ 1362.128115]         00000000 00000000 80ce0000 80ce0000 00000000 80c04d7c 00000000 00000002
[ 1362.136565]         83b50d20 80ce0000 834e1cec 80d8c750 00000002 80cd7380 80da5f2c 00000000
[ 1362.144962]         00000000 809bae70 00000000 00000000 80d8c750 80d8c750 00000001 00000000
[ 1362.153412]         809baecc 00000002 80cd7380 80d8c74c 00000000 809bb11c 00000000 834e1cec
[ 1362.161868]         ...
[ 1362.164327] Call Trace:
[ 1362.166835] [<809ba6fc>] __schedule+0x504/0xc28
[ 1362.171385] [<809bae70>] schedule+0x50/0x190
[ 1362.175651] [<809bb11c>] schedule_preempt_disabled+0x1c/0x34
[ 1362.181361] [<809bdd48>] __mutex_lock+0x310/0x940
[ 1362.186132] [<809be394>] mutex_lock_nested+0x1c/0x28
[ 1362.191101] [<806c2640>] register_netdevice_notifier+0x60/0x168	<-- Trying to get lock "rtnl_mutex" via rtnl_lock();
[ 1362.197073] [<805504ac>] netdev_trig_activate+0x194/0x1e4
[ 1362.202490] [<8054e28c>] led_trigger_set+0x1d4/0x360			<-- Hold lock "triggers_list_lock" by down_read(&triggers_list_lock);
[ 1362.207511] [<8054eb38>] led_trigger_write+0xd8/0x14c
[ 1362.212566] [<80381d98>] sysfs_kf_bin_write+0x80/0xbc
[ 1362.217688] [<8037fcd8>] kernfs_fop_write_iter+0x17c/0x28c
[ 1362.223174] [<802cbd70>] vfs_write+0x21c/0x3c4
[ 1362.227712] [<802cc0c4>] ksys_write+0x78/0x12c
[ 1362.232164] [<80014504>] syscall_common+0x34/0x58
```

When the above two tasks are created at the same time, there is a
probability that it will cause the network and LED to fail to
initialize.

[1] https://github.com/openwrt/openwrt/issues/18472

Regards,
Shiji Yang

