Return-Path: <linux-leds+bounces-8663-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kUWIObz/M2qWKgYAu9opvQ
	(envelope-from <linux-leds+bounces-8663-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 18 Jun 2026 16:25:00 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5007B6A0EBB
	for <lists+linux-leds@lfdr.de>; Thu, 18 Jun 2026 16:25:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=outlook.com header.s=selector1 header.b=aoYxLbsj;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8663-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-8663-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=outlook.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 007F6300B9D5
	for <lists+linux-leds@lfdr.de>; Thu, 18 Jun 2026 14:24:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 381D93B47F7;
	Thu, 18 Jun 2026 14:24:12 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazolkn19011030.outbound.protection.outlook.com [52.103.32.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67843281503;
	Thu, 18 Jun 2026 14:24:10 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781792652; cv=fail; b=qeobQetQ3qqFvHohzthTnulJSA3Y2DL8646yLp5bfZjM8t2d9muwT4yQZE3mqX/EtlmmHbhtNaiUBSfa/nWtPcHvqqN1QbvKRkRA53qkm6PP5gIh05//8Iw4AAw5maX60BjcjONidwv+5oaB1wDwRumO63aHqfQB7PNoEqr3XYk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781792652; c=relaxed/simple;
	bh=zBcRCs07tblSAzJojM4fMjW+kprIGyrWfEcK+uQKw9Y=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 Content-Type:MIME-Version; b=HlhWd4rVClNL/Di24waiw544W8Y/nUxL6MlcsWRQY9qiMqdOxnS0LANAqPFRS8a6I9zvyraERukJoS5pFW1+WiqX/foHamSD1THGsoh3tq/ZqxoiTDnuSoxGrcaRoSTMTlhPji+WcpgX7OoHoKqTunGTYnFDmLSZMOTkPPorxGk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=aoYxLbsj; arc=fail smtp.client-ip=52.103.32.30
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UJm69KuOgcpUtCas7Y4zcbnIvZpnsxI5GXqlzJoV63iUoG0TMZtxgV88VDKGiJBvrRa8NR736al/MK50hFedEjwSU8HUFLRBEP28A5HaBduZPsy0VC7CpnNWdylY0i0qSw+1o4P1u6KEew80CjNEtZtL3fPVZ0chn0xzMSMDI4rRRQ0aDaiBRFpIU1eqgKjMaQtChUQZpWxyNhLlDqTfvJaPBX9vkksLzaHGS5pj+MdVjvmSXNTqoJ2pSHHr5C/VzOt23RJLep/oEDFTTrcoG042BAfw5sBfwl5WvoLzt77lmrZuoD9tqzjgdabUWgEodcwNGywb2Gw25DdOqLE1Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5zCla2b28GS58K9ofz9KjSpjM+X6PdPAf5OYPKdWQ6A=;
 b=n3Hacp0asDC/MiS1KHDKf/xgBS7PwDI3UsSFewqI8OfeGtSaVFsD9Co8kgDi6Ai0HPkFEDap6MDXn41GQNMN1dGtTte8V7aFf3yawWxWWDQ19eOFjl6dpTnYGUa1qheMtIOAs7A5JU7fUrjpIUZW4d+JRV1O7w13dPNhe/kuFS6VPyg8BuC3xJ2264SE8DYk0MKneyliAimi8IIEtR9YX2snlrgWKgamo5BawfnnRRsXPDbYaR74wo+fbtME8S3Ty9ZNyo6OpM57Sgw9Z5nE6EE/curbsyvr35R+ulWoyQmAGj3XjxGUwZdcoGM3BRgoR8uovIwywqXhVqpLjMvS9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5zCla2b28GS58K9ofz9KjSpjM+X6PdPAf5OYPKdWQ6A=;
 b=aoYxLbsjP/G/JnNrn66cUSrkyv6jXsAOJqpIQYf0Lk0c4AqjnyNgIhE5c97l8IqBBbmBcBkvklI8yPibnPMsSAAH8AZc3tiZXgojiBafzmJvNc99e7AXnFmKgLOXd9FAF0VJ8eHyiX17CsPeY0rSUVVaI268JxXKnFqFUxnY3mYfmJXVfZ9zJ2AdQLAiUwoUAblCfnnMy6FL/WXxwnA2iuBzvK6tatt+ETiY1nA36tKUFXuL7/vImBUICK9PYY3HV815+8jFHYht945/f4MeMCqiPsy0ONlKxdv/eb1ZSK/LyXOcCkh+RXYdTA+548+UkTsS4IVoWY3lmFc7IlUn2w==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by VI0PR08MB11988.eurprd08.prod.outlook.com (2603:10a6:800:344::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Thu, 18 Jun
 2026 14:24:07 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0139.009; Thu, 18 Jun 2026
 14:24:07 +0000
Date: Thu, 18 Jun 2026 15:23:59 +0100 (BST)
From: Manuel Fombuena <fombuena@outlook.com>
To: Lee Jones <lee@kernel.org>
cc: pavel@kernel.org, vicentiu.galanopulo@remote-tech.co.uk, 
    linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/9] leds: st1202: fix multiple bugs in pattern engine
 and brightness handling
In-Reply-To: <20260617150455.GK10056@google.com>
Message-ID:
 <GV1PR08MB849763E14B7E11DB39AE90C7C5E32@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB849762937DA5B82DC89F1CC4C5112@GV1PR08MB8497.eurprd08.prod.outlook.com> <20260617150455.GK10056@google.com>
Content-Type: multipart/mixed; boundary="279769088-1197921116-1781792646=:367688"
X-ClientProxiedBy: LO4P123CA0507.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:272::17) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <564b1532-fb10-fc7d-e4f8-1df6eaf58a5e@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|VI0PR08MB11988:EE_
X-MS-Office365-Filtering-Correlation-Id: 7043be03-fa96-4338-1564-08decd454178
X-MS-Exchange-SLBlob-MailProps:
	laRBL560oLSPhlJ95/U7v6W/AahuugGaeq8Xnxjb4MSQEoVu7vFDq9bIz9yYHkSbTk4PzAJnoLSa+UBehx97Cqq5Lp8jpPmpcotGlhUFK2IM/xixpfmgSk8eFu/aLRo4+v89+88fcJmi+ITkw5ePqJVKKvYOYc4S5xYV7Nu9Eg1CwCsuU6bykeHOmvioLmCXRYXdn/hhxcsyChByweGIhcCcP6Ik7tdcBg+DBYTw7L2RugmzHTupnM6ZuxUZ04Tmj+23LIzT6frBwwCBXd8m1z7Xb874+a1GneKT+hhSkjE6ni9aaaHf4ODVBYGktieaDLhjlFBq0BcjB7BWIHZ+LQ1a3psu6W4FJd0GA4KRmXyp/nPKxMWO/2pvtZPC0rmbyaIyhw8PbGkfZGieLzLBukoQOYYctAlxuim68Sy62JuSyV68+3A19C/oOxzCjbe0zcSgTsZyt2yXMnR14+V/dz3XHHM959+MLnEgBExBu6ZLkgPPqYFTb8Q/CPWb/8H15lycr9GrFJhWdS5x4vB3YntwhofPo78KlVP+7zz9Xmm9M4lfCNigXb9DXrloI7YNPqvXH8MBFMY5nSkfn+6q1L08GlRTpIJI3XCATRl8NYtB6348xZ0CQBnMkYe4fRlqEt7iXz9rcOoKAh+Oc7ILVCqaJ1LWfONwKiScYp2HZc+3JMphUCw4drO/yvE9ie8DYylELjSQGXJhc9JLQiUl0xKur2N01j/l7PW5QFhQhFtKT61mbbqNRatbdKYpO+ysOOPYRhXq6ZeFJZaJsLNXU0Itft9aiOsk
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|23021999003|8060799015|15080799012|19110799012|5072599009|12121999013|24021099003|37011999003|51005399006|12091999003|10035399007|3412199025|440099028|4302099013|40105399003|1141799003|1602099012;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YnNhd0JTZWJWQjhlMXZPbm1VWk9zNVRtSUZZWHZWaUhIMlU1dTBzYWhJWkpt?=
 =?utf-8?B?NjczblBLQU44eFZUNU1YZytpdy9xTUpPcFlHQnNINXFlNit3TkdYREdXNGlT?=
 =?utf-8?B?VitKME1peXNhaXVuSzVENENubHF2VzhsNGhFUzkyOEhXMmpmWHlZc2JhNFhp?=
 =?utf-8?B?Q1VmZVgzM2NZMkh0YnYrNXB4bndFUTRZbXJOeldaT0drNTRPQUZ4aUpRZEY0?=
 =?utf-8?B?OXo5Zi9BVHMxQnYrRzZzN3gvMWxKNzVYYjFCbmVqeWZyQ3hLK285QVg1dnp3?=
 =?utf-8?B?YmRXQXFVSWc3NDF1K0RiclduZ3J2NHdrM3UxR3J2cnpyYU1jT3UzUTZ5MWlk?=
 =?utf-8?B?MWFPWG9Mbk9mYU0vUGdvSWFHVy9UMUkwSTgrOGthQS9jdHFzckdFdklGUEZz?=
 =?utf-8?B?UFVlYVZINDZoVUJVZjQyUUVId0pJODlGSVJuQ21QOEhQUHh1REREeWt5T21M?=
 =?utf-8?B?SzBVaC9kVGttR1lrMFZNbkRKUlVYQlZORFNmUkZ5TUxDUGIwazZTMWd6c0JC?=
 =?utf-8?B?U3hiWldCR3FtNnRPSkUvRGRQMTgzTm9yS01Kc3d3dzl6TVdiVFZiODRvYzBH?=
 =?utf-8?B?MnBESnNXUFM0SFpCZVRBRW56RXY0R2lBYU9qb2NzYmJuRlF2REJ4TzlRS3V5?=
 =?utf-8?B?M0lLNGQrbHRoYk13K1E1Y1VQbFU4WEoxRXYzVkF4TnA0b2xWT0tqeUo4NGNq?=
 =?utf-8?B?QUM2Vnd2R1NEbXY4V2tOdENxb21ZL1NPU0lJZGZYWWpxVm05TG5Bdk8xVmRi?=
 =?utf-8?B?cFp5anhGRUlqaTdEL0ZNWEFZQmErbEtsUS9EbGErb2RzbDkzcytLdk9YL0tj?=
 =?utf-8?B?a0h6RHRWYkVXOEd3cTFGVDBrVTJEdGlaNDczdHpLLzdVeFdIWkUwWHNVejZP?=
 =?utf-8?B?VkN3K1RBTC9XcnQ3UHdKYk5WWVBVSnVWckFYYStnbXFGOTFOWnBJeUR2WUtQ?=
 =?utf-8?B?RmNwb0x4NEtDUTRPRExva2pCSzJjK0Zrc25lcHlpQ0JUd0RxclpoQXlLOTBo?=
 =?utf-8?B?c1ZEakZNeGpZWXl4Qnc1Vmk4Z3B6aUtDS2hkd2tpc3VTeWZNVnVOZ1UxNjNG?=
 =?utf-8?B?bHpNV2I2azN1SWI2U3JmY3lyUXRUYmNoMi9kbUJZdXRVYlVBTHFvanpuejV2?=
 =?utf-8?B?Ly9YZnFEOWF5WGFhSG4yTHh4NEIyQjg5d2FnRS83Vi9KYXVPL3RNNFJDa0VJ?=
 =?utf-8?B?aEZvWk9JYllObXhtWnIrWlNkRUF3RzlwVzVGRW4xellPaEtTZGovNloxMmNs?=
 =?utf-8?B?Ti9xQ2ppRXd0aWt6Vm1xemZxVUxLMlMzZGFyL2w1anZVczFoNlpiaGhJMk05?=
 =?utf-8?B?akxhWXlDb0dRUUV1VElMTEQ5NXN4Q2FYUkRONElBWGRjL2crd1JxQ2ZPK2Nr?=
 =?utf-8?B?NGVZYmI2TERHazJnVE9MeGptN3VaZ1BBTE81YmZQWG5QcTNodnppMkwxbG9Q?=
 =?utf-8?B?UXlkeEQxMU1wQmpydDJsaDhrOEhEcVFJY1BIVG96TWZpME9FYUhGZzhPdmFI?=
 =?utf-8?Q?q1/CFE=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YVpjRk9sbDlNRzhoZEJ0ekM5R29yOWlFd0liZnFaQlRITE9GL1hhcDE2VWZB?=
 =?utf-8?B?OG1tRzFzTDBiWFdWZUVESkpNVnpwdTR0Q2VPNHdjR3FXOWNOdWEzTnN1OE5V?=
 =?utf-8?B?alpJdk5ncHFsT0lVNkNEQk84eWRQN0grc3gyV3Y3aUdIN0FoNTFtRUFCOUhL?=
 =?utf-8?B?RGNURk9FdDJDTlFEV2RMeUVER0g3NDRKTnlKc1JKclRHbkVwMG9MTlc1Rlhl?=
 =?utf-8?B?cUJ5cGRRU245S3hvY1VKT3c2VXRiemtlYkIwN05RZi9QdkpJdldGREtBVStN?=
 =?utf-8?B?QjdFMy9BcktRVElyekRuekpoWnVDdUpxRUNncHBnbEszdDFNUktCaFlnTkIw?=
 =?utf-8?B?SzliT3preGJ4Z0NSMlhWUVhEL1BjKzRyYTVaMEFGTWZ6TEZCWkxpS0FkV0I5?=
 =?utf-8?B?ZEw3SnlYcUVNWEZrdU9RYXVGeFd2K3llbjFPWC9ZelFZZUJORnZJc2RobXlk?=
 =?utf-8?B?OGk2eWRaeVhVeEt3ZnF3ZFNwd0hGQXFzdjRpMkpoUTh3bzI2QUhjOUZaM0Fo?=
 =?utf-8?B?SWxQRm5QMVJLZ2V5ZEdvYWFraUQ0RHJtSk9kTnlUVFNiS3RCYmhtRDdKdURU?=
 =?utf-8?B?NmUwNlIwMUM3Y3R6aHkwZXg5eHRiMzVUVlhQd3NvVEdwWTRRN01YalF5RWIr?=
 =?utf-8?B?OUpGV3pPVUhvVTBHdUZSdGJxdUVQU0hzQ2dOMWFuTnpkVlVYR2llS1JXQmJE?=
 =?utf-8?B?NlhLTDJGK2pINS96azJlbktOMnI5UC8rbGFJRzE1WnJsVlVvSVZQaSsybXNW?=
 =?utf-8?B?cFBOWE52MjVrS0F2TUxxdlQ2azdzUkZTR01UMkNpb2E4Q1JJZEo3SFlrYmpJ?=
 =?utf-8?B?VG1CQ2FKYStxdnlvNnlyeG5FZTMxbEtWaSs5dFh0eG4xZkxxbDVnMmZIZjJ4?=
 =?utf-8?B?Slh6OHhQUGg3bGg4UHFGNFN2MXltNEZsZjFoNXg0N1piVFdkNzE1czA4ZWVr?=
 =?utf-8?B?MHJxT00vejIrbmVqMUxjcDc3T1RZR1lnRFA3bGJBTTNOVmUwTlBnYTRweFRI?=
 =?utf-8?B?MWdNNUF5MVRSbFhCT21XemFvQ05XQThsazVWWkVzT3prOFZ6cTZWM3IwK1hM?=
 =?utf-8?B?Smg5MWRRdm4yR21kbTRlK3B1NzBoUjJyck51YVpHNVNOa3JsVDJubCs3dzN5?=
 =?utf-8?B?SkVxN2FTVjVEWVgrRStDemhkd1Q5NFo0cU5DeFhOV3ZObmVvRE1JTFNqeGIx?=
 =?utf-8?B?M3Z3cC9DM1FFNy90NVdBWlBPWXIxMlk0ZWh6SHFrU1ZFR1RZOXNaWlNRTzcz?=
 =?utf-8?B?QmhPOGRnS2ZIZmlzMUpPdlJDcmZYaWUyRDdzQ1VIemJhb2xvOXFIY2puaWNN?=
 =?utf-8?B?RzNsWkhmSTFGL2o0QjVLQWtXNGZiM1dXUXdYbGlHYzV3RStXMXhWOEczblIr?=
 =?utf-8?B?cFpRUHBIMkh1T1ZrUmtoaG4vZ2dGY25NajV6cW5NOEV0R0o0TXFheUp4VE9w?=
 =?utf-8?B?OUpXcktkMlhPZ21PUHJUSG5HdVFEcis2K0ZXUEtrRVEwY3RuZmY0aTJFMlFm?=
 =?utf-8?B?cHk2eDJVZ2FBb2thVHdCb24rRlRmQnlwSTRWWlZmS1RQV2hDYWxBQjVPbjJn?=
 =?utf-8?B?bk5La0Jsd3BoMVByOWx0T2xvSU1zM1FNVzd0NGpSWVZ6VmZTeTVicWpOMEJZ?=
 =?utf-8?B?dGE4NmM0T0w3VHBDcDRlK1ZJZ3VyaGtpTkUxSS9pVEwySTZCN0FhcHNEeEll?=
 =?utf-8?B?RjY2aFU1L0owOEdrWUc4QVU0ZDVEOHRBMlBRNGJzRGlHY21RckpVOStOOWIv?=
 =?utf-8?B?bDc0OU5uaStML0UzTW8yaVBaR2dvM3A5c1FYK0xzL0h4K1NMM2VSdkd1bVBz?=
 =?utf-8?B?TlNCSlE0N2RJQU41b3VWRXk3SWtZNlpvRGZmSUhZbWFkTEpKWTNPVW1BVWJY?=
 =?utf-8?B?Vkhab3doTGhIbW5qSlFJbjBWcGtCSTV1ZkpBM3BZVXRwdGxQZk5QRlp3MHJU?=
 =?utf-8?Q?p2954FeAkny4wGRvx6riUoeppqff62xt?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7043be03-fa96-4338-1564-08decd454178
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 14:24:07.1659
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB11988
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	CTYPE_MIXED_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[outlook.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8663-lists,linux-leds=lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+];
	FORGED_SENDER(0.00)[fombuena@outlook.com,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:vicentiu.galanopulo@remote-tech.co.uk,m:linux-leds@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[outlook.com:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fombuena@outlook.com,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,outlook.com:dkim,outlook.com:from_mime,GV1PR08MB8497.eurprd08.prod.outlook.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5007B6A0EBB

--279769088-1197921116-1781792646=:367688
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 17 Jun 2026, Lee Jones wrote:

> 
> I was going to comment on each patch, but here, take the whole review:
> 
> https://sashiko.dev/#/patchset/GV1PR08MB84976729EED25ECB484835A4C5112@GV1PR08MB8497.eurprd08.prod.outlook.com
> 

The Sashiko review of v2 resulted in several changes in v3: patches 3
and 4 were squashed, patch 5 was dropped as unnecessary, a redundant
I2C write was removed from patch 4, two commit messages were corrected,
and a new patch was added for the reg bounds check. Pre-existing issues
flagged in the review are outside the scope of this series and will be
addressed separately.

The Sashiko review of v3 has surfaced two new issues not present in the
earlier review. Both have been fixed and will be included in v4:

  - Patch 7: pattern_set() did not re-enable the hardware channel before
    starting the sequencer. If brightness had previously been set to zero
    (disabling the channel), the pattern would run but produce no light.

  - Patch 8: reg was declared as signed int but populated via
    of_property_read_u32(). A device tree value >= 0x80000000 would be
    interpreted as negative and silently bypass the bounds check. reg is
    now declared as u32.

The remaining comments in both reviews are pre-existing issues outside
the scope of this series and will be addressed separately. For
completeness, a full summary of the v3 review comments and responses
follows.

Patch 1: stop pattern sequence before reprogramming
----------------------------------------------------

Comment 1: Does clearing PATS break multi-channel independence? Could
zeroing the channel PWM registers suffice instead of stopping the
sequencer?

Response: Simply zeroing the PWM makes the LED visually dark but leaves
the sequencer running with stale duration values. Since the datasheet
(§4.8) states that writes to duration registers are only applied after
the sequence completes or is stopped, a subsequent pattern_set() call
would silently fail to reprogram timing without stopping first. Stopping
the sequencer is required for correctness. The global sequencer
constraint is an inherent hardware limitation acknowledged in the commit
message.

Comment 2: pattern_set() overwrites globally shared duration registers,
silently corrupting timings for other active channels. (Pre-existing)

Response: Acknowledged. Tracked for a follow-up submission.

Comment 3: brightness_set() acquires a mutex and performs I2C
transactions, making it unsafe to assign to the non-blocking
brightness_set callback. (Pre-existing)

Response: Acknowledged. Tracked for a follow-up submission.


Patch 2: validate pattern input before stopping the sequence
------------------------------------------------------------

Comment 1: brightness_set() acquires a mutex and performs I2C
transactions, making it unsafe to assign to the non-blocking
brightness_set callback. (Pre-existing, repeated)

Response: Acknowledged. Tracked for a follow-up submission.


Patch 3: fix pattern duration prescaler and pattern_clear skip marker
---------------------------------------------------------------------

Comment 1: Writing 0 to shared duration registers in pattern_clear()
halts patterns on all other active LEDs. (Pre-existing, repeated)

Response: Acknowledged. This is an inherent hardware constraint — the
LED1202 has a single global pattern sequencer. Tracked for a follow-up
submission.

Comment 2: st1202_pwm_pattern_write() writes an unscaled 8-bit value
to a 12-bit register, limiting pattern duty cycle to ~6.2%. (Pre-existing)

Response: Acknowledged. Tracked for a follow-up submission.

Comment 3: brightness_set() sleeps in atomic context. (Pre-existing, 
repeated)

Response: Acknowledged. Tracked for a follow-up submission.


Patch 4: restore Pattern0 PWM to full on after clearing pattern
---------------------------------------------------------------

Comment 1: pattern_clear() and pattern_set() mutate global chip state,
halting patterns on other channels. (Pre-existing, repeated)

Response: Acknowledged. Tracked for a follow-up submission.

Comment 2: brightness_set() sleeps in atomic context. (Pre-existing, 
repeated)

Response: Acknowledged. Tracked for a follow-up submission.

Comment 3: brightness_set_blocking ignores the requested brightness
value and only toggles the channel on or off. (Pre-existing, repeated)

Response: Acknowledged. Tracked for a follow-up submission.

Comment 4: PWM scaling limits pattern duty cycle to ~6.2%. (Pre-existing, 
repeated)

Response: Acknowledged. Tracked for a follow-up submission.

Comment 5: Unused duration slots not cleared in pattern_set() when
programming a shorter pattern than the previous one. (Pre-existing, 
repeated)

Response: Acknowledged. Tracked for a follow-up submission.


Patch 5: fix spurious pattern sequence start in setup
-----------------------------------------------------

Comment 1: brightness_set() sleeps in atomic context. (Pre-existing, 
repeated)

Response: Acknowledged. Tracked for a follow-up submission.

Comment 2: brightness_set_blocking ignores the requested brightness
value. (Pre-existing, repeated)

Response: Acknowledged. Tracked for a follow-up submission.

Comment 3: Global duration registers clobbered by per-LED pattern
operations. (Pre-existing, repeated)

Response: Acknowledged. Tracked for a follow-up submission.

Comment 4: Unused trailing duration slots not cleared in pattern_set().
(Pre-existing, repeated)

Response: Acknowledged. Tracked for a follow-up submission.


Patch 6: fix brightness having no effect while pattern mode is active
---------------------------------------------------------------------

Comment 1: brightness_set() sleeps in atomic context. (Pre-existing, 
repeated)

Response: Acknowledged. Tracked for a follow-up submission.

Comment 2: Clearing PATS in brightness_set() halts patterns on all
other channels. Reviewer suggests an alternative: set all 8 PWM steps
for the target channel to full duty cycle instead of stopping the global
sequencer, so the channel appears at constant brightness without
disrupting other channels. (Pre-existing)

Response: Acknowledged. The alternative approach is noted as a potential
fix direction in the follow-up submission.


Patch 7: disable channel when brightness is set to zero
-------------------------------------------------------

Comment 1: brightness_set() sleeps in atomic context. (Pre-existing, 
repeated)

Response: Acknowledged. Tracked for a follow-up submission.

Comment 2: If brightness is set to 0 (channel disabled), a subsequent
pattern_set() starts the sequencer without re-enabling the channel,
so the pattern runs but emits no light.

Response: Real bug. pattern_set() does not call __st1202_channel_set()
to re-enable the channel, unlike blink_set() which does. To be fixed.

Comment 3: brightness_set_blocking ignores the requested brightness
value. (Pre-existing, repeated)

Response: Acknowledged. Tracked for a follow-up submission.


Patch 8: validate LED reg property against channel count
--------------------------------------------------------

Comment 1: reg is declared as signed int but populated via
of_property_read_u32(). A DT value >= 0x80000000 would be interpreted
as negative and bypass the reg >= ST1202_MAX_LEDS check, leading to a
negative out-of-bounds array access.

Response: Real bug in this patch. reg must be changed to u32. To be
fixed.

Comment 2: fwnode stored without incrementing the reference count,
potential use-after-free if the DT node is dynamically removed.
(Pre-existing, repeated)

Response: Acknowledged. Tracked for a follow-up submission.

Comment 3: brightness_set() sleeps in atomic context. (Pre-existing, 
repeated)

Response: Acknowledged. Tracked for a follow-up submission.


Patch 9: correct and extend hw_pattern documentation
-----------------------------------------------------

No issues raised.

--
Manuel Fombuena
--279769088-1197921116-1781792646=:367688--

