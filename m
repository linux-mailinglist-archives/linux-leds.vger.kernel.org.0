Return-Path: <linux-leds+bounces-8672-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RfdpLjwLNGrPLwYAu9opvQ
	(envelope-from <linux-leds+bounces-8672-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 18 Jun 2026 17:14:04 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 310BC6A1267
	for <lists+linux-leds@lfdr.de>; Thu, 18 Jun 2026 17:14:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=outlook.com header.s=selector1 header.b=I4r6ri6s;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8672-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-leds+bounces-8672-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=outlook.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EC3B63043C08
	for <lists+linux-leds@lfdr.de>; Thu, 18 Jun 2026 15:13:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E6763DD537;
	Thu, 18 Jun 2026 15:13:46 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazolkn19010022.outbound.protection.outlook.com [52.103.33.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C29BC329C48;
	Thu, 18 Jun 2026 15:13:44 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781795626; cv=fail; b=t69+grZtwq3EkO+WtrA/X7WnIuzr46inBx3NLo1n3D4PoJmjaGW6EgbRzq+P7iuMvnt5/lIJ0462JIHXtN9fFBmVyT4BOePHtVniMLIYi/iZJmfrvrCyuVpQ92JHJzcgGG7bhNSfRxqFmWNozpQ85GUsQVM877yp2WqvDhXzrs8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781795626; c=relaxed/simple;
	bh=ag+H0qjA03/rt5AKl5fCQl8Xg+cKrk9VrB6yitV4Q3c=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CUt3fKhf0jSvuzc+jMk9IihKLbyzIT0HtSx/5JAIPz18h5d0HZ+uLp5UEygCk5/Q/039WEbn+W/o8mMu7DJk0fki1IJjnnuViR42G3qu1+4HTgDMfsHRUHgkQ7f1hRjbwkJrJpJGa7cMNvxHNhmYi07MoXZNtjbosm7jpDqDjok=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=I4r6ri6s; arc=fail smtp.client-ip=52.103.33.22
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ng+5+JCiHZ6zRsvxb67HfMCuJuVLlBacg7v0US+SDFg9ti7FNYiCpOKHmJ/zPCniFH32AA6vlT3PbsZNdEjWe0CJqOSKkIH3WrEHqg/kP1O5NqNc8s7KEaS9X06P8TSe6BuuCJwyoEc1tY7logwLpbEmZC+doMeL8SKRhi2ztqPQaejUW5BSUSRMEqk6KTas/qk/h8+S8YjWJ9Iww1E6PwkcpQleNjpPRQbTZGLHb3OUN7ONcQnKHz4U3/eevMvKV1sHL5ZYYoesZB/1rRS/2vGAhEBrnvhws1G7v8TBtefYxCswyvkWL7kG1NMr3jmG+M0Gl320uWL0AP1jCPD0vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WzxzYVadqoSR/OG/Qgn5l0Dm0v8gJhb41D3M2Q272v4=;
 b=KL/GWLMzjLw71xNuFvs//fum/D5O6k3xE+Itw0XeBY9os1oiXLkVxIdiCPOpiFRAo3iyarisMxXkc3m7hixPhuckh7Sy4YsaEFImuU/FHPF8FmJtetLPR/E7zUziWpqOhP0VMyQh9ZXxTIAIknUv0zNLYpMo7jpEghtJZI7FA0hholK87L/2hIMk40fIW85wz+t2LvaBjkiRHhioHlvRqMXFAZlUndIZZQEyU2gLpkz/7HUodKTkduDlu90MIg7E8Yf82M5/I7H8spCL9F2k8IC+QTScFtviS66UY7qfe6gz8ocGT5IlfDZ6nuZBegY+s9m0NUH6RD9CrdwpHYieVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WzxzYVadqoSR/OG/Qgn5l0Dm0v8gJhb41D3M2Q272v4=;
 b=I4r6ri6sEKQlziTpToSQ90AE8HmDdQL5lJrcPl9dqHMwf/DG1K6mRtLdw4aHIBCfbUt5r43TfHhjQr1kthAzBqraZuO4F5BDAxMiNK74YzeNSBbUWG5x7Kf7HfGi+zTsuMXf58WwJNorOPzHF6CE0CtulgxpxVkEWR2XfaVWeK0tajo3sYe2C7AK2l+AjzCi0vQHeeMJiaV/7Yn13I7n77LWBVSdKG9Oh3PoRueBb6RE5N8debkKSNW7ACKG7GwhPIaF7ZRPSdaDwadlqWFFW0FbT5ww0g5u6JidlKxzxolFp7Rs0isf4Hpjd1reQWUGL5yDOCoYZEg6fGqu5BzUVQ==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by DU2PR08MB10160.eurprd08.prod.outlook.com (2603:10a6:10:496::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 18 Jun
 2026 15:13:41 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0139.009; Thu, 18 Jun 2026
 15:13:41 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 7/9] leds: st1202: disable channel when brightness is set to zero
Date: Thu, 18 Jun 2026 16:13:29 +0100
Message-ID:
 <GV1PR08MB849786A9686B85A6F7375462C5E32@GV1PR08MB8497.eurprd08.prod.outlook.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <GV1PR08MB849700625A78304DD5FFCA3EC5E32@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB849700625A78304DD5FFCA3EC5E32@GV1PR08MB8497.eurprd08.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR3P193CA0014.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:50::19) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <20260618151329.701887-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|DU2PR08MB10160:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fa3e7b5-aa9e-4608-47ba-08decd4c2e34
X-MS-Exchange-SLBlob-MailProps:
	WaIXnCbdHrO+2YmbT5jW+WUSUt4IT5vR1sEDWlVmUlDJ6ENLfRu57JRaFrbBZ9Ln5F267mdF+pK7p9W2Ud9P8vPcwBfYvSqFcY6o1bJCQLf3A2WBC6CjRZjsvDGjmw4Uh1pfyBq5kfWTV9lvNMO6LuoKuNk0V2cXCs2crv97w5mxSA7SDIbbLiMkxwcRoUKJO6Xrt3+CdFxvtRAiZp24D1Q/VYyhaymsBdUPFPsISjLPvLvRI7DoE3zmukHGjpd7uMQ7ldqNZNBJvzDZ4vqyULruWds5g+GtyyN76QqDzvz+TEnZhRnzXIcJ9rplvuu7bXl8P3+Lsmz75la/ugfX3nZBfWgBBMs1w7AiyjoVt/29Wz0ezKD/d7UjjUnziIs97ud7BaDPgk0GzisBsqbsbAdZgUGywEnNL4FZ/l3s6AGRHa8ocuYYRGXvFnugOmtcesHdby7bOsZagbYIT7cXGG6WPUXbq4t2kUbuq2a86cFMSnD1t5qcBnT/FcRfp0rE9q/FjoJIrSc1KgMzSAVegbHL0We3ZrNyLdwEpWSja0aH0mwchQ7/dPLOct+SbkmBZRC+CvTKUC410cPxLYv3/hWBt0efke4+/mrb2JhDneVVFQTNCwx+0yodX2ofRjXip9dno5Rf07GEBG6CwwS26ExlCCcrXe2dJyVZV2atx0xoFeP3+SjcwtVae1vhmBNpU5g8BENvaS6iNRCQchnLbGSWSgB2K15EmTWu7sNbG4cIe2GseJSR6/4meKqt/+X9jLx5g3n9hQ0=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|24021099003|15080799012|51005399006|23021999003|5072599009|19110799012|37011999003|8060799015|41001999006|440099028|3412199025|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UFk+ecy+NMY41ZS/Ui2uJCoB3yI7XbVBN7rsZOCNC/OMMtFsLDUzy/M34WPL?=
 =?us-ascii?Q?W3BCGGGfXOPxSDK2iqND65CtLjDWd6muzmZFjxh4eoh2sIgXeaMvStmG+Lut?=
 =?us-ascii?Q?qbw8CbXk+Iv057PRQ6n1QQhzaAvglupdDDtSmjSsZwVjVDMdj9G4iA+DyHjC?=
 =?us-ascii?Q?hrLBX5MHsF8cvYotUbTguMXiCLfKeuGGbD7hgGRipFUda75WId1PAAzee3M5?=
 =?us-ascii?Q?alOtrveyRAvSoCtEyaworF3MqGHwPjeanv/vdrtSbZBSzV6ZhFPibRQgqZem?=
 =?us-ascii?Q?lrjQeuAm3AvqzmBpSTfV1thmT4rtiURReVngJaiXHv95jq0KUF7Yh3QfRbcu?=
 =?us-ascii?Q?bBr4iPiqTn7O2RuCVNbWNDY/z/cgKorRmVxUd+nfIu65nXFi+eck1QfnFzAM?=
 =?us-ascii?Q?S5kN9Ork+ocqiu1C/0Lh/itOMt3lfwXphJGamqs73fbWcg88XbrPtPiMpEVX?=
 =?us-ascii?Q?sLH6Qd0OIR64dCteKPA1gTF1u9JHEuvO/yGNjWAnUmHz+Wa16Bkxm+TaLvLP?=
 =?us-ascii?Q?wDeVc4VeSXYTQIE86SoTgnjIf4RO2n3N9pb2yRzqDfEld8zwUjW2pdcYGFQ5?=
 =?us-ascii?Q?N5dmOA3ZTGYvmr7pK41OXXchmNRjarUVoGEHbRZkUDEQTejQqFqvV1qT8BF5?=
 =?us-ascii?Q?U8MfmGr4zpEZWE8qG8GI0ldAuijUlv7pIlBl0tmvCTyhOO/yZHAUulUo3IlI?=
 =?us-ascii?Q?y/6+AvwBWLgobt81IKweVyy6bNHbYtrc3fKmE6sufPLqldTPBVYdr6M0l5G2?=
 =?us-ascii?Q?wZXhifcM9qCYxky7bQtQORqd7kA18LJZqAwx4+3H8roFZP0r/oWdea9dOBcW?=
 =?us-ascii?Q?calIL1piPEyg5CHhvPh1zztBdX6K05DwfJj+xGbTv4TRi/9Opy7CnNh9IKkV?=
 =?us-ascii?Q?tT15eL5zOh/tw2x4/CTeBQldEQJcro/nGNNN9D3zUhDTelo1taaSwxoUbU+Y?=
 =?us-ascii?Q?vKfFSOQqboRsb7JT+gs+u89eZ270K/x0A/PP/uq5fPNgDn6P6J8jMUqtLKHL?=
 =?us-ascii?Q?rxXB?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?64ELEJBv0UNG/DGDGSpPNBpBwfk6CFiUAAolYRUY8xAkmuJ6J+Sv2CRgJDN4?=
 =?us-ascii?Q?slzvJXV/HYoMltadSoRwK3PJhDAjNMJ46Lx8oIZEz+bUcnZpYhoMMknw+Vaq?=
 =?us-ascii?Q?uwr4RvigNJyidgeTaT+2tWA7tZTm8cZba6JFkSugVWW/JOHivMOSqXEOaV4i?=
 =?us-ascii?Q?a/tXWuntOEP+w18amy2nLxRtYn6KD0Nxf+WeBA/3cATjCsOU+pFyJ6MKBh1z?=
 =?us-ascii?Q?3rVwU1VazXLkehpGdIOV0BEJmwjI0j0lQSTyIw0F4m5zhpb+P1eCZ7FL6gkA?=
 =?us-ascii?Q?vOh3XgdrFOunw/+OeqEp7QhAY+GNv0lEZBg+U3fvXQBtZI0P9toriS52K1aL?=
 =?us-ascii?Q?6D53sHrzc1sJxfDBks+aIkvIRXtq+KZtx4W+/+qd4zKGyEuqshChZibzBhas?=
 =?us-ascii?Q?/7DroynePb0dcjMv/eT3mdz9JyYfzpTYCStEKIqB9QOAEsDF0fCdUC6HCjPs?=
 =?us-ascii?Q?+cMyWeo1n/HxGgv4RI1ne+bJKYkuDWuMFOr2F8/d0A6IhrA5WmYMXcewAF1u?=
 =?us-ascii?Q?C4tikm+ByxgZ9BBgSlWvvpnvyUhBLZtO8DMnwq0CneJtxzVJ5A2RfdZjGK/s?=
 =?us-ascii?Q?EkSZHPBTeGmaZAfFwjDDaHHdYJ8MyXLcEvDRGjrQPuhM2gdKMAvlsxrZlEXC?=
 =?us-ascii?Q?BlHhXXQp4e7lAsqIgvlIFZBLC7ZEI0gz/iKg40HRQFMcABuYE0pismSJEZ1E?=
 =?us-ascii?Q?08Z4qPtt+grY9kvZOkDqB8E0msGOKEe9eY/n140m03xWZVCKeBVjxM2NBACU?=
 =?us-ascii?Q?ItFpe2DfxWKtN49R8w4Fhi1caGf6cqUecXaHpJ+QfJPc0zaRL5XOZAHJkHoY?=
 =?us-ascii?Q?s80dy+0ixhnRa7F5VqdclgdkXyDs8L5a+yMlvnZxEziM65HbwBtztZAnU9EU?=
 =?us-ascii?Q?wqEE5lsyY59uL34goIB+5MJsjJwSWu34Kfvy+o91Zy6KXQSEXOujON4htW+m?=
 =?us-ascii?Q?TQKEJVOP8en0s9VDVFttO1dd28YYf178H+tKjvl3lSxXq4j0ZeAPM5nYHgC3?=
 =?us-ascii?Q?y/nfzADm0tSYTOvQNumJfwscquEDmbFVrohwm1fhtnPwwr2p55ikddsG7ASL?=
 =?us-ascii?Q?S+oSXSv26o6BfHbsv+3mYT/TKCkLIzb7exNDwcZcPX80qiWf6S5PLJsioZXn?=
 =?us-ascii?Q?jWoX8zVGt/8BvMMzD/GPR96WRvdMffMQvLd4d260sRiyUetboaPoDRxMhMhX?=
 =?us-ascii?Q?m0DvzgHWkRitirFhZFJBs38CwXRgNQEFPI4oFPlqX4pGvsG2av8288nVA8U4?=
 =?us-ascii?Q?78UF3hlqsjWB3RA+rqJZqN7BRkJydISWHmPgVRntknv/pFWlILxW7YxHP8Xz?=
 =?us-ascii?Q?vPVGgPsLMxOsSksybg9t6OFUjc5BgkCc5Plo01zcU7VBoeFPdUU9MyYn9rrf?=
 =?us-ascii?Q?kuTTf9FwoxY+1s0xdzKRuZ9p4hY0E1DKNkq4a2QzXA3Sd0K6Cw0ma7x5xsG3?=
 =?us-ascii?Q?DGovQAawPaBOx42JTTpTAZKxgiJGEgAH?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fa3e7b5-aa9e-4608-47ba-08decd4c2e34
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 15:13:41.4234
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10160
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8672-lists,linux-leds=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[outlook.com];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:vicentiu.galanopulo@remote-tech.co.uk,m:linux-leds@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[fombuena@outlook.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[outlook.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fombuena@outlook.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,GV1PR08MB8497.eurprd08.prod.outlook.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,outlook.com:dkim,outlook.com:email,outlook.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 310BC6A1267

When brightness_set() is called with LED_OFF, only the ILED register is
zeroed; the channel enable bit is left set from probe time. A hardware
channel enabled with ILED=0 still draws a small residual current, causing
a dim glow even when the LED is supposed to be off.

Fix this by splitting st1202_channel_set() into a lockless inner function
__st1202_channel_set() and a locking wrapper, then calling the inner
function from brightness_set() while it already holds the mutex. The
channel is now disabled when value is zero and re-enabled when non-zero,
in the same lock region as the ILED write.

Fixes: 259230378c65 ("leds: Add LED1202 I2C driver")
Signed-off-by: Manuel Fombuena <fombuena@outlook.com>
Assisted-by: Claude:claude-sonnet-4-6
---
 drivers/leds/leds-st1202.c | 66 ++++++++++++++++++++++----------------
 1 file changed, 38 insertions(+), 28 deletions(-)

diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
index 4fa41cc74412..cc071742e703 100644
--- a/drivers/leds/leds-st1202.c
+++ b/drivers/leds/leds-st1202.c
@@ -128,38 +128,11 @@ static int st1202_duration_pattern_write(struct st1202_chip *chip, int pattern,
 				st1202_prescalar_to_miliseconds(value));
 }
 
-static void st1202_brightness_set(struct led_classdev *led_cdev,
-				enum led_brightness value)
-{
-	struct st1202_led *led = cdev_to_st1202_led(led_cdev);
-	struct st1202_chip *chip = led->chip;
-
-	guard(mutex)(&chip->lock);
-
-	st1202_write_reg(chip, ST1202_CONFIG_REG, ST1202_CONFIG_REG_SHFT);
-	st1202_write_reg(chip, ST1202_ILED_REG0 + led->led_num, value);
-}
-
-static enum led_brightness st1202_brightness_get(struct led_classdev *led_cdev)
-{
-	struct st1202_led *led = cdev_to_st1202_led(led_cdev);
-	struct st1202_chip *chip = led->chip;
-	u8 value = 0;
-
-	guard(mutex)(&chip->lock);
-
-	st1202_read_reg(chip, ST1202_ILED_REG0 + led->led_num, &value);
-
-	return value;
-}
-
-static int st1202_channel_set(struct st1202_chip *chip, int led_num, bool active)
+static int __st1202_channel_set(struct st1202_chip *chip, int led_num, bool active)
 {
 	u8 chan_low, chan_high;
 	int ret;
 
-	guard(mutex)(&chip->lock);
-
 	if (led_num <= 7) {
 		ret = st1202_read_reg(chip, ST1202_CHAN_ENABLE_LOW, &chan_low);
 		if (ret < 0)
@@ -187,6 +160,39 @@ static int st1202_channel_set(struct st1202_chip *chip, int led_num, bool active
 	return 0;
 }
 
+static int st1202_channel_set(struct st1202_chip *chip, int led_num, bool active)
+{
+	guard(mutex)(&chip->lock);
+
+	return __st1202_channel_set(chip, led_num, active);
+}
+
+static void st1202_brightness_set(struct led_classdev *led_cdev,
+				enum led_brightness value)
+{
+	struct st1202_led *led = cdev_to_st1202_led(led_cdev);
+	struct st1202_chip *chip = led->chip;
+
+	guard(mutex)(&chip->lock);
+
+	st1202_write_reg(chip, ST1202_CONFIG_REG, ST1202_CONFIG_REG_SHFT);
+	st1202_write_reg(chip, ST1202_ILED_REG0 + led->led_num, value);
+	__st1202_channel_set(chip, led->led_num, !!value);
+}
+
+static enum led_brightness st1202_brightness_get(struct led_classdev *led_cdev)
+{
+	struct st1202_led *led = cdev_to_st1202_led(led_cdev);
+	struct st1202_chip *chip = led->chip;
+	u8 value = 0;
+
+	guard(mutex)(&chip->lock);
+
+	st1202_read_reg(chip, ST1202_ILED_REG0 + led->led_num, &value);
+
+	return value;
+}
+
 static int st1202_led_set(struct led_classdev *ldev, enum led_brightness value)
 {
 	struct st1202_led *led = cdev_to_st1202_led(ldev);
@@ -264,6 +270,10 @@ static int st1202_led_pattern_set(struct led_classdev *ldev,
 	if (ret != 0)
 		return ret;
 
+	ret = __st1202_channel_set(chip, led->led_num, true);
+	if (ret != 0)
+		return ret;
+
 	ret = st1202_write_reg(chip, ST1202_CONFIG_REG, (ST1202_CONFIG_REG_PATSR |
 							ST1202_CONFIG_REG_PATS | ST1202_CONFIG_REG_SHFT));
 	if (ret != 0)
-- 
2.54.0


