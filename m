Return-Path: <linux-leds+bounces-3971-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E75A34895
	for <lists+linux-leds@lfdr.de>; Thu, 13 Feb 2025 16:54:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 88E7A18837DE
	for <lists+linux-leds@lfdr.de>; Thu, 13 Feb 2025 15:54:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C286166F32;
	Thu, 13 Feb 2025 15:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="QCQE+NgM"
X-Original-To: linux-leds@vger.kernel.org
Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazolkn19011026.outbound.protection.outlook.com [52.103.38.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698C826B08B;
	Thu, 13 Feb 2025 15:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.38.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739462073; cv=fail; b=S4yBdkjivToTM/CjBbj4VT5ZYSDO9J50iDaES2hBvBwfjQ2Kef5aeWZxk7kVplxpk6BT1wHHB/wf2pYB3oL+kIreeocfaRayMUbEoyp/s6a49c1lNtpfCN8Qm9c2Gsr7vpuxG1tYuFzzV2JbDKp4RKUZDm1nBZ/Uck2YIg09iWw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739462073; c=relaxed/simple;
	bh=Ylqg8sNroDK2G5OQKlLukFPsn8POyws0JZ0Eu9/0pOc=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 Content-Type:MIME-Version; b=iwN9upFZGSTgRjSnVv2geHEypLEBhLnczHu3vdbMCNIHHx1NlrXA0cVQEVgTzQr9nhTOe9nZqhlDbjFZY1EDKQGTHt8+Hge+k8NHvhOan353/BO/+C++5PHVyvEsLK3zCM/AzDxdZK8iW2gE8MaPsCkvCVHYBv2CTNpQP6V1HwQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=QCQE+NgM; arc=fail smtp.client-ip=52.103.38.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ABW0Hi8Fy7u506rFSupRP9jJOZUpETqUpbnMFSs7zBi7FpllhvVeKssU7ReX4kvEB3py0YR6vimk5xYviLmSNZ26kSpVQbwC05r7Impz+WAgX+7eD3T1uk0s7qUZ7iSn/VWNHkg8Pyta/PR0J4kaQG5xRdRJYSUskhabwDpPkjEGebXSTDBfacKS42OoztXdwDJLzHWEslzrr4clFbdNEsq+BX0OYB35ZaPsoD9hxD0MOHr3EX7ZGMWXJ/yq+5GGXMii9Am+xUJ+V5BzDciAiwfaNiEou2xx9w2NVKaRIL1YuI64/0KR4umiWe3Tyf+7MEj6a58E53NzVf4QajB+bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G5pTJBX6rMGmFZq+Qqm/r0BZvj0MzBWtBUg/Rqloo50=;
 b=CqVKEwGtY6XcTMKq/bbzkz9b9RD8gMWJ3Wfy1aCjCNdz9wMdyybLcb5COJ4HUdu2bK+9pSUd3BtuwIWJ68MCJ9FJxb6P0/pIALbElrEInPGMK5/YQSjH0o/FvnWoTk4wp4noPqeVpGxbC/O4oTxcWB7c/6gzylN3igWdnfPMtskKYUhs2r2jQ4nXoDWJGlSfQdMDzxCsObN/B/7YFc0dKdzwCIOxWQwXUNn/3cNu9No9MNqEDbqB6pPwmvGbgt0nEzp7RSMgVv1EN8ImEEbFTlauer3Z9wjk+rwAYPd5HCkmKgOn8DB2SLk/9OuaI/pxI0Q8SWEbqZWhS1fliehyRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G5pTJBX6rMGmFZq+Qqm/r0BZvj0MzBWtBUg/Rqloo50=;
 b=QCQE+NgMiXr9Dy4yenhv8yN9TeDwO38ZQCSr3yApbyMFZRx8ecZQNAcHuAPgmfTyeaxYzU5fFlPxjo1b0BoSgWLLv9ZWRj1XIZk4Vx1Sj//UVYJ7v4leVCp9DidPIAfos32Yb0NzmU4X4rlkr1XLzDNx9kIwI/fGUl58+0JX9cgwfe2e6HUKiWYz6UII4ohSoFPnkN3yX2ALWtJimvvZAqUiccr7jFD4jrYFAzXpIN4cG6Mhi9p97pAPZzDgRVtOs9KMdabbI+RjhKHtdy+sNAbDq6u9MO5MnL/nPy+lQOwKP+xgGLP3ylmHNNoKniEbWCp5Y7FBfckhf1ERw46VOg==
Received: from CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:160::13)
 by LO0P123MB7700.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:42a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.16; Thu, 13 Feb
 2025 15:54:27 +0000
Received: from CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
 ([fe80::c0fe:9ff5:51fd:3fdb]) by CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
 ([fe80::c0fe:9ff5:51fd:3fdb%5]) with mapi id 15.20.8445.015; Thu, 13 Feb 2025
 15:54:27 +0000
Date: Thu, 13 Feb 2025 15:54:19 +0000 (GMT)
From: Manuel Fombuena <fombuena@outlook.com>
To: Lee Jones <lee@kernel.org>
cc: Manuel Fombuena <fombuena@outlook.com>, pavel@ucw.cz, corbet@lwn.net, 
    linux-leds@vger.kernel.org, linux-doc@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND 0/5] LED1202 / leds-st1202 fixes and
 improvements
In-Reply-To: <20250213104119.GD2756671@google.com>
Message-ID:
 <CWLP123MB5473AD120D1AA064D44B10C7C5FF2@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM>
References: <CWLP123MB5473933B9B97137828ACC6A6C5EB2@CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM> <20250213104119.GD2756671@google.com>
Content-Type: text/plain; charset=US-ASCII
X-ClientProxiedBy: AS9PR0301CA0017.eurprd03.prod.outlook.com
 (2603:10a6:20b:468::33) To CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:160::13)
X-Microsoft-Original-Message-ID:
 <db7cbbf1-63b0-fbaf-3db9-f8389e2f2643@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB5473:EE_|LO0P123MB7700:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cbb1d2b-71af-4479-f2e0-08dd4c46b1a6
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|7092599003|15080799006|6090799003|461199028|5072599009|19110799003|8060799006|440099028|3412199025|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RO4KPHVvitmhU/ZMlIJDPkxb+TbDoG1MQtyg+7KcfyXKlOkH55sJmwLcjBrE?=
 =?us-ascii?Q?td0UK5sAandPiAQXZxeQy3oM/2VEJu6GyHBK3UXXJo+d/dHBNeKaRcJb5X8/?=
 =?us-ascii?Q?g95IKs58/9uDs4Xw/zC8nXzixINLo9auhrhTtRTkQ/AamQc9yLFn4xO9vAKm?=
 =?us-ascii?Q?G0zjn4WuX7JHWtk/7wJ40BGu4mPQBWeJBTFCRfKD5I30x7S81JfktyOy6wmx?=
 =?us-ascii?Q?WNFGd8TKXb+OrxZVdW873vqMsKr6ixqcBqwwnA6+OQUp/VlNqOqsCJ1Y8kMs?=
 =?us-ascii?Q?WCDrtY26VZtIVpotaRzhZBaeucMNBU/nnS3+kAwnxBP1dfh6HP6mUiziDTi+?=
 =?us-ascii?Q?8k72R0WcshXC1OZM3gh9Yueni38S+D65cIpDkwPqM/1JRvlCHUD+JSDqWYMQ?=
 =?us-ascii?Q?qGTj99TjIXQKdrWcSnqcJnZ6+S/JmqVFeAQBHW3ZSMiY2Vu54ZoIP6KoiBJr?=
 =?us-ascii?Q?apMwHX960N7hlqJ2JDqmqyfr0WMeUBQOcsRxmFvQr4EePaB8+IJvhjmBW5Ce?=
 =?us-ascii?Q?6LHHBudWpgn7UNT9EK7gEcYHQXG8tfzkqdBF2ledq2igWc4Z1e4vDvGLKEDe?=
 =?us-ascii?Q?yfyPhr2uYiEWoNwd9t9I9pHtahmuOy6J+qqcrBKx4zvhfuZFGvldaPOzRvuk?=
 =?us-ascii?Q?xsuf3bD+nkc/VdbzNj5C91gTEvt7OMaBet6qSGzCAREyIoesxoJ0jO4qMEr0?=
 =?us-ascii?Q?8cFhm9zQuyC9FLH+/v5Hj+Skg8moj8bSFerNlcyXMVI7h2cgRUNgHFV4ZhKL?=
 =?us-ascii?Q?Sd9jEJ1KnjUR1ur9U8EX0gxA0scN0anSYIAqTfga0kShfVgR754NaeR2rY4q?=
 =?us-ascii?Q?yCBjbdGla5OwR83iccm14xAFAyDPWv+UYoYLnHoJTRbenThqDB2ccm6fkSbr?=
 =?us-ascii?Q?ObAvzcw+NlPo3rIgGsTXdhn4YMzR9wkUbW7TfEBYTUZpUV61IbXXbio6DupE?=
 =?us-ascii?Q?XbNc6/7fiLumlJi5BIjTJfL+uD5tq3IhDladVpEe/EIZRk+EG3Jb1pB3Xdla?=
 =?us-ascii?Q?LSnleI4i74MMIEEUC3S/MP7eYt6QKPEz1Aoa6MivBWceZKv7Jxc3ZgL36Wft?=
 =?us-ascii?Q?47MW4jmZyTXnWoOZDkrUn9Bp0TX9CguI8IENIEzfl189YGzV2iM6Ok3J3jBo?=
 =?us-ascii?Q?306UridLVjSSqRgRCIZE0Yu8YSxWjATM7g=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZlWjkYW+fbgpZ1RmOa6ufEQxdsRWjo3GuKn3KXrW7RtcvWkRsdlVp3+H0xXf?=
 =?us-ascii?Q?QL05pko39E8oVAGWm2z0OlD2efR52BDqiGaxvj8Zrhey7lE3JtkukqCtx4xr?=
 =?us-ascii?Q?Ts6vUXFzdcOJ1oRV8fuydoy3WfYEREYLTzSgKx1qW1XrA8iBZioQhGIxrizg?=
 =?us-ascii?Q?xUNSHz3+dy+LzHSwxQt3UbKo0qCS0CDuXaBkjaYyMdHdN1/ChfbeU0MgL7d6?=
 =?us-ascii?Q?bPe1rxranmR2SZUBJNhUWp9G3HyxCU5tPpivSGmCj7jH/W+G/oIM5dOQJkH9?=
 =?us-ascii?Q?vGM+mH2MSLsoq7mfPuCCs+TilHB3qsestPSsR6xXT3R4j5Ee3zmt+kgAuUS8?=
 =?us-ascii?Q?M/iCfNNjXj/Dq6PUTlYkCnDTLd8/ASYMnGUdo0BND6BeGxTxLV9Mfht2cvTN?=
 =?us-ascii?Q?/L5ReO6cmHHNhK/PDasxk2y9Rsts3r/UzEuX74zMPOajyNixRCtRjQz76AwR?=
 =?us-ascii?Q?OImGXZjekbsFpD0Y3HgTDFyBSr5SkhDUlug3EmFCsJTlYyrYolHoiTG3OtYQ?=
 =?us-ascii?Q?5lZ6PPMJHAXZqa3sTOAPY8oG3vUXtOcJixLOQWaipywW0ycOr+CH9QdoqefC?=
 =?us-ascii?Q?E4PGOL5CYa3/5vo7q8y//8CoDE1aySFQm8KKCyjfFVfUIGNY2Yi4XysXRsXg?=
 =?us-ascii?Q?JUyC5pIIKf9z5Oia1X9baQPyJw9AjQF1Q7HLtsDNcUtc4ckRueIJlMii74PQ?=
 =?us-ascii?Q?MKLGZUSO/FXZIlxeplw5tEVeDcThsvGeNvMl8YyHQbC6LAmZL15i8Pe8FZW+?=
 =?us-ascii?Q?akMGH68HKnA4luNcUI7Ca4YYMuYf1/debjUN/l8EbFQvbI7QTPuI2nztocgE?=
 =?us-ascii?Q?XSkHgXMSxrqZaiHFkbGkbGPdlv2KZ/yRu8lZbXbxHN4qX6G4tLrMVGt/hOYJ?=
 =?us-ascii?Q?eOP6d60Yqf+ccEPQKoHOx68j87xLprk4aaDqPMjT+sRylrtTBmZwOJFN3SMi?=
 =?us-ascii?Q?2LKkhJFN5r+aOsbwFiw1+lSxzAfVgFrM9Yfbj2Z4ZhrpuRIvWgqc8b7OK2OX?=
 =?us-ascii?Q?ZZQlln3b+erOuvhj7SqgGPqHgST+EpB9yCzJwfxxXVxBopLdEjhIA0ZZE9F0?=
 =?us-ascii?Q?HjLeau/OqrBdzMluXLNs+QWjIMIc4G3OKy1OsxaBNVEwRRXot774WwneT1RE?=
 =?us-ascii?Q?XXiK1PNm652HZOCf9ox4QMFcz26Rl9y1uZM/RIQej/iePAeqAtajAlki8gQY?=
 =?us-ascii?Q?5aqaqtgBIH8dvVuRU82A2tmQPhBaI8Gbn6ZwHkgY5nazyomqY13zLeebL5B1?=
 =?us-ascii?Q?zERgTEItrpojCfOrOlzd43havQI1uOYN5hmBPkPIu+rdAgBeUS4ocMmQJpxp?=
 =?us-ascii?Q?AcA=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cbb1d2b-71af-4479-f2e0-08dd4c46b1a6
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB5473.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2025 15:54:27.1998
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P123MB7700

On Thu, 13 Feb 2025, Lee Jones wrote:

> Stripping the separators from patch file names and pasting them
> culminates in a terrible summary.  In no way does this cover-letter
> describe what you're trying to achieve, why you're trying to achieve it
> and the consequences for not applying the set.  Nor does it communicate
> any merge intentions (which is required due to the assumptions made, as
> described in our previous conversation).

Do the messages in the diff section of the patches need similar 
improvements?

--
Manuel Fombuena

