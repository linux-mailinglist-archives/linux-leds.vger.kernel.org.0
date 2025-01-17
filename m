Return-Path: <linux-leds+bounces-3811-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 78EF7A159FC
	for <lists+linux-leds@lfdr.de>; Sat, 18 Jan 2025 00:40:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CEAEB3A8EF6
	for <lists+linux-leds@lfdr.de>; Fri, 17 Jan 2025 23:40:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C12E51DDA39;
	Fri, 17 Jan 2025 23:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="I0tAY4XH"
X-Original-To: linux-leds@vger.kernel.org
Received: from GBR01-CWX-obe.outbound.protection.outlook.com (mail-cwxgbr01olkn2023.outbound.protection.outlook.com [40.92.112.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A241D8A16;
	Fri, 17 Jan 2025 23:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.112.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737157239; cv=fail; b=qwxkxFACg9L0XO1rKBK5xud4d5rJZBUoo8JY5oznYI/yCUhe7In2ueR8vfBqmhPk7PEbevc4gaMijSrV4njCaX6eJUPiJ/Cdgex1+3FpTNx+x6BuBjy2ieUzjqDjvzyV53exeE/qK5VYY85K3/xWV9bwA/ylqjeRT5eD+xY0U/0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737157239; c=relaxed/simple;
	bh=QNp5kRRzOeWvEyN6XN8bzjqGpSGgnZYi8BH31HRPUpE=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=hcrM9iaKBYw08wtsU1wJLps82w/beshnuW82u1MhRVigFSy/QTskY1L2u84zumUekVtezwIvPDwDsVKkO5Z8BuzfLpuFrQX5t6f5hDUDCy3epEV5C9XxXmejMl4chx9RsTLZIT/masEq3S88Ijdk3XHf/PCTbAi3LUhFCVhywhM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=I0tAY4XH; arc=fail smtp.client-ip=40.92.112.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MENMtPB+rhIoBcKryYfr9i+XOOcLm1OQcuBMicZ7WgsHB2FQkrFImfmfB1F0PcBxbh7IUUQzVSDzDa++PXTZD3MGVMMQwv5TX4V7pcP/dv/nvHiCZ2Rfr5KBptdnfmy8+S+KJla+HrnOsLC2rrK/jnqHwRoJNNBCHM0loDs3GHMx8XGZe6fTT6D03K0krvH3rJuQTEg/ZbBJn8GNgP0u5pA5INHXcTheNdYbFxn3gjFCn/b8Or3H7iKgERcgUsR0eM/Ic1lNuJNT8lZaZ+V/e7zuwp8FPlMhu2g1TxIGdtfIFifLXFdkhR5B/3n7j0TpCryz2iJGP2Hm8vKBIKEy2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wVfBBqADjUxm4LCzHfEQNLAl1HQVe8uC/uuZ7Mg6jZM=;
 b=oaKex7XFsqezIbhFNbE+JbYg0TqV+ymJFwKkGZNN0Y2w7P9mDSktI/dClx8XI/3nsHYS5nrZQ1eBQ1sE8UDTviXhiHqU71cMmIe7V5avBUG9vLsN28Ov4nws5wgQkZ5nY8emO9GD7SiBNGHkVdWnWnpYnfVuiXmj5neetwyjzZQZVOvJCfN0fvhahmdj7Y1Nm8yVXiTY9y7Sg+HaqtMVr6g93u8rn423DtmrBUOILQMe/Uy7EZ6Uq2nNeF12UMbZC+80onZyRlPH88fy3ytq4ZrNRahcqUdTvJv9sjmcjcJAa7vm/vLlPlnEpZPcC8mA7OZDHD1Bn/UIL3lpgSsRaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wVfBBqADjUxm4LCzHfEQNLAl1HQVe8uC/uuZ7Mg6jZM=;
 b=I0tAY4XHathKlqqnfxu5yFoyd7UbLmN3LYDTJSjYRqGmLfkrsEkbKHwW+nKC/9u/1JaHf8dHzHug+TG5ESrfdjVau6iADBpGntXHq0BENtx44RePqGVTWQcAQVtl3sUngDg/Bep3CmLLGJA/w4PySE3EboTOl1gwQO9eigqPlq5fpVVpaX8J4MrwrUFBB+OeQIPQI/P+HOGZwlfb4DiQJXK7qg7OHbHy1xUhNVZihNuQgfu++Xg5wkqQxL/AGnzhJGZStqphtzJOTzuYNsA8cy/+s6hVN1qJIOhUe+XCz6VfzVEQi3yCGv3hwdBuN1VeUl2mNbWvLsdkige896Xo9Q==
Received: from CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:160::13)
 by CWXP123MB4166.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:b4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.17; Fri, 17 Jan
 2025 23:40:35 +0000
Received: from CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
 ([fe80::c0fe:9ff5:51fd:3fdb]) by CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
 ([fe80::c0fe:9ff5:51fd:3fdb%6]) with mapi id 15.20.8356.014; Fri, 17 Jan 2025
 23:40:35 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: pavel@ucw.cz,
	lee@kernel.org,
	corbet@lwn.net,
	linux-leds@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] LED1202 / leds-st1202 fixes and improvements
Date: Fri, 17 Jan 2025 23:40:26 +0000
Message-ID:
 <CWLP123MB54730097DE29F13197077965C51B2@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.48.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CWLP123CA0273.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:1d5::20) To CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:160::13)
X-Microsoft-Original-Message-ID:
 <20250117234034.670794-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB5473:EE_|CWXP123MB4166:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b21f497-2a62-4201-472a-08dd37505691
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8060799006|15080799006|5072599009|461199028|7092599003|19110799003|440099028|3412199025;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?20AEhAhTYwTUWx+CsiYGY0Z3o4wyAir7IrgbCyZ50tRySfpP3NeciYCLt2FW?=
 =?us-ascii?Q?vh3rzJ0K/hDKYcR0nGmkvracR3yMQxYjj+oujjQqAskZ11naTTlJsUkZ3QBW?=
 =?us-ascii?Q?lfItM3GjDKQFwbApd2w49UhhiGQK+SqfY82IXLxnHQ7sqVE+s7wb4DN07q26?=
 =?us-ascii?Q?jUVPFqAx6ajXhiOBGLwNoWTcmsh/YQYlagDD2bO9CjR8IEffWyi6epE82jES?=
 =?us-ascii?Q?uBKU4l0zkQi99aB7YD9aO9LBrnBal5q5917US7CVM/cSuTmAs6NdQIXFbK4E?=
 =?us-ascii?Q?nLvn6PD557ZevtstKA22sYsozzFjvsW9i2EseBtQilRT7/Nqiv/EsXSA1iyS?=
 =?us-ascii?Q?1EYbffsESXflTV4q55wInuM335MDkNga9IwLJv6A2QgCcMTr/PFv/iq4Tc7H?=
 =?us-ascii?Q?AUacUeXAPcVVHwnHMbkRRuMZcJsIekZQG/hTA8FmO5B2ENO7boN3Rj7AKVVC?=
 =?us-ascii?Q?hDBGvV/z7y7ge7U6NRSxaWQGHHIyMyreFwav+giAVc9Jp6g5/IeI42I8JmCW?=
 =?us-ascii?Q?w3dEOvIo2Ew6mdyCG7r7witmDA8tIgrOZIB6lR4WgyhDheBc6YvFr8Wa6mm+?=
 =?us-ascii?Q?unZkvKe7be6iUdHaUG07zyG+kawx51Ypd8Mg8ZLCkWXydp0y5fSCHcnxaBH+?=
 =?us-ascii?Q?FyxgB17R0XbIGsYP0D2kPQcj75cvxsXnkqpyEgS1UrF5X/38FDG6MKXyUxFv?=
 =?us-ascii?Q?3ifi0mb8AAnhQhMWYlVOrfwB5VuWZRHCMvTaDX08Nr4bP2n+h7bQq3njq+me?=
 =?us-ascii?Q?GthGSdvCWX/vC1/q89f+khHsil374ZGCRWZRZYawktlHe/VLyFeoD1raQbHQ?=
 =?us-ascii?Q?ry21UNLr+WGMnZm6nYF555A5Jd6zqZYWcbeQ6tDS6ybwq6sLLtCtfE5WwNfE?=
 =?us-ascii?Q?lOIj6PZ3cQoI4TV1TvkJkgKsqvEzryNFdeXPZ9nKvy6/6XU7em0fP9+FjenZ?=
 =?us-ascii?Q?xYd9SGGQNVdIWSJlbU5+JSpnUMkP4aWmr3QlmCjzNlfXwTbMuQHiUZjVwixB?=
 =?us-ascii?Q?ZN2FHiw/Xg4jNwSGoKaBqrOM6CkVl4EPNSnZb4n1xASKIYwSw83izfrWQE7p?=
 =?us-ascii?Q?MPaK/Sba4ihZZSWqBzlxvqpk9UsxPQ=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Jjoc/wqRbTrmg6pBTuHRCNIAI6FAdIJlK83rO2jb4sG74WJ0r2oIITzaVldc?=
 =?us-ascii?Q?G46CY9t9fkTZpV/3Q7lKMvjsSrYp/IJjNIb8WVfH78zDP8AfEQlooolHE7dz?=
 =?us-ascii?Q?M2TN2p/25eN+wb3gbMT6UpZBeO2o43K7YBc3zvaJCKB6pB7IKwNzIMdnj3z7?=
 =?us-ascii?Q?Zb/tuZ0XfzKxXadk0SY5eLsfSIkynSRLGFzYYZuabGATAn2z9Uqxu5WdEmA8?=
 =?us-ascii?Q?1PBWvxRrpfSZqBfZOyzEWk8ituQm6YCGuXgVNN8zpeBfj9JhtJm8NKsqptMe?=
 =?us-ascii?Q?v05g/6CpB1yQOlB02YCc8mY5lOi73xsGAdPICjR1SRI6uJdQgSkd8caj5QMg?=
 =?us-ascii?Q?GgWyPme8RqBWJoVRW7e1GBP3akHsSzlNnn0b/4qONtc/O7a3kOsm/SHHezq8?=
 =?us-ascii?Q?2QU6ccsOa5E0+2eFKdAQjLTjtBhmBsYKN2kD9uLB+e3GPB3JcLexv+4U/95B?=
 =?us-ascii?Q?NiySf5aaHp2F134YRMAl4/82MahKfq/m+smPlu2t4NJI1hG1Xm2AovHpVAg7?=
 =?us-ascii?Q?dXmNVhGOmdnvBapC/9YfNRrGmvGQLeRhB6bE9crHVLKgsm77pQgL+Ilik1os?=
 =?us-ascii?Q?EVN9Z2uAttszDYU2cHFXFRYDiPijY6SAbzQAOKnYvDpyteski5HHA51DQwmT?=
 =?us-ascii?Q?mSsfrbpkmbBhwdVjRjEN/DLK2ZAUSN0rpkncGi6xvxzYB6LqklvpDIORKDNj?=
 =?us-ascii?Q?/gYL9nh3TMJLNnVws75EV3wpKnjR9jgCp2MAHJjMQPN2+8pjG7W+2Nn83RCT?=
 =?us-ascii?Q?9+PZM7OMMovA11lQmpR2cTDeRrv1e6upPzvZyvW0HibyuKpOPLiIwwK5Jcx8?=
 =?us-ascii?Q?MwvSWWGvWKHRyUG/x6isYHrOhpVqUCKMAE7Mnwg7thTOFwQGIRXiJoKeeW5E?=
 =?us-ascii?Q?b4DBOO+URr3+3XqldDdtzVcMugWfqungm5RykTZaO5S5mR7XGg+3xS3LtHDp?=
 =?us-ascii?Q?3M37SzQ6SCzHFexJ1vIpQfuwRCr2A+q9FUEl63nnMtueuTqnvTEKpFw6k3t3?=
 =?us-ascii?Q?4HHjU2iQ022RPIWskGaWRgTOVRaMaF5/XtCa7JLWLzlH/KdktdwKtcg9OR8Z?=
 =?us-ascii?Q?l00Xp6ktFH2edjL8gYr1mjTQftyPeY5Yk5js3OQExNH7ztprE+uftUGYtLCe?=
 =?us-ascii?Q?WTTNc/KKvSlBptT8pvUklqaYzwRUfYmu/icdVD8Ca+d66XujrqCwy21B4Kr/?=
 =?us-ascii?Q?oRVLytnrSexEGieIe3aF4tzMgqFCYhx+pPM3jwOrTL+y2rdFRbACuDAaFeIy?=
 =?us-ascii?Q?IFnu+QIkpcDpVAEn8nZ+w/hw9Q5wFxqx2JmKLhdGDm+CKgfWd9E1SmfIDI3x?=
 =?us-ascii?Q?gIk=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b21f497-2a62-4201-472a-08dd37505691
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2025 23:40:35.2659
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP123MB4166

Collection of patches for the recently added leds-st1202 driver.

Obvious from the individual descriptions, but as a summary:

- 0001: fix a NULL pointer access error that occurs when LEDs are
registered but the LED driver is not fully initialized
- 0002: initialize the LED driver before any DT LED initialization is done
- 0003: some spacing and typo edits
- 0004: include the appropriate select in Kconfig to make sure the
required Pattern trigger driver is available.
- 0005: remove .rst extension on Documentation/leds/index.rst

Manuel Fombuena (5):
  leds: leds-st1202: fix NULL pointer access on race condition
  leds: leds-st1202: initialize hardware before DT node child operations
  leds: leds-st1202: spacing and proofreading editing
  leds: Kconfig: leds-st1202: add select for required
    LEDS_TRIGGER_PATTERN
  Documentation: leds: remove .rst extension for leds-st1202 on index

 Documentation/leds/index.rst |  2 +-
 drivers/leds/Kconfig         |  1 +
 drivers/leds/leds-st1202.c   | 73 ++++++++++++++++++------------------
 3 files changed, 38 insertions(+), 38 deletions(-)

-- 
2.48.1


