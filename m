Return-Path: <linux-leds+bounces-3395-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6FE9C5186
	for <lists+linux-leds@lfdr.de>; Tue, 12 Nov 2024 10:11:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4ECC628263A
	for <lists+linux-leds@lfdr.de>; Tue, 12 Nov 2024 09:11:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B585320C499;
	Tue, 12 Nov 2024 09:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.b="f1zB9PZC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.b="raab+w/i"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx08-0057a101.pphosted.com (mx08-0057a101.pphosted.com [185.183.31.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24AAE20A5FB;
	Tue, 12 Nov 2024 09:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.183.31.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731402669; cv=fail; b=rTEp668AtpepEoeT9olVMg83OZJD7AKA7ntWMx9UmwfpVIJKwZVHwUaVNNN8wvov/53jPEtqh6f0CrVkcIncddpX+g3osWxd6i3q8Y6zBbjzlGdkrYMyNMJuaItJTgwe0BiVJNxozpOorHo2xYyVfdrXwxvnJdiNgRwgCkCzEnU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731402669; c=relaxed/simple;
	bh=oKTeMMHSevo76VCayw0WesIpQ6JrZukmu2YG4BPIXDM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=S2ltBSfC+FERicCm0a/Kp/68mIXrBT2rhimZ3ThsyyGi1N0lAbZkSRv3Ep+bJcFoKwlKTD9B28cxeFSYuMZYiizUwz09MhXN10O+Dh2yMdTHNmFcoFmT4Pskl/x8kAzCSvDLZBphDbNzxDvHQWtgsGGg42IIFa3Kup0dCPgJFZA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com; spf=pass smtp.mailfrom=westermo.com; dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.b=f1zB9PZC; dkim=fail (1024-bit key) header.d=beijerelectronicsab.onmicrosoft.com header.i=@beijerelectronicsab.onmicrosoft.com header.b=raab+w/i reason="signature verification failed"; arc=fail smtp.client-ip=185.183.31.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=westermo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=westermo.com
Received: from pps.filterd (m0214196.ppops.net [127.0.0.1])
	by mx07-0057a101.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AC6e245009245;
	Tue, 12 Nov 2024 10:10:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=westermo.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=270620241; bh=
	a7YmF6JbEt5AqjXAy17MCySRvE6nDiiwlvyuUPZmPQw=; b=f1zB9PZCNbhuXPGk
	FtKUrOVDCe7vqm9BuXDNkMk66KsKSvk97khvujhq5aAUpV0Zjjw9UqJVzKQC6fVy
	V0PXqdGsLrgVThenLsAjCEw859cvHqmvapVLybJNaQez7ptbsP86JU0x/3mDag9R
	P/5zW8jxO7WzYUis96jNIcCw7w74Lc1E7IVV4+B9yZcOjIBpNZiDWKGlu6JilVdC
	+xlx/ZfcNXqoUC/SGQGMrRBWhUOLug4VB3aKhYjRjw18Kj5a9PDshLLgzMytHuwT
	GkWWI+mYkhuHmWtQFxWWBnLs2GIHfTi9IaTSsajg4FjuwWwvIq5mE6lbfR/diMFd
	VMahMw==
Received: from eur05-vi1-obe.outbound.protection.outlook.com (mail-vi1eur05lp2168.outbound.protection.outlook.com [104.47.17.168])
	by mx07-0057a101.pphosted.com (PPS) with ESMTPS id 42uwxjrak4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 10:10:52 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aY0f9yDb8UFEjPuX86afMqaP1MoNVSTH066sMXkq//tej8GFYF5eWChZ3uFOET2Zgoiejowt23cYPdgB3oymqWwJcCcNZJg6sUTNgfOktAuTqeg+tHbM+u09//MdLii33wDu+cpQll6yX9hNKFXr9pAbNhrBeq92TATQ8CxE5+rBHe+pU32p3Zvg/0djx59x7riePp7f0cP6eGJJ0DLuLHhUHkbIRJI1MZfYjDMFiZUyClt7vCX/NlD5zg7GF8H1gCYUQluYj7gwvoXuRR9eOYQnkBPkqa4xXrR8MbbCLYZUWFSNKePhZlICpufp6LC5n142eZdRjltgzmqIQinojQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/iOuX0ThF9UUI1qHonXeDkI6VngCaUVeMalA+HQrFPQ=;
 b=mpApii51CDpNMlZssCySmgZ1J6XCfgKllOoydMauzlEh0BBKfTt6gQXBBzcrDG10lQNhO/jLMTCsL28mzj9D/03u/wubknYX+BACRjZbh5Gi5e30l9ulkwSANR/DL1vLKhOAo6HnlrnSk1c3BLhlMsljHu/BeVfdz5sdo8YIVOdGxeacCVn2eGzBvA/1aEkhJJwEblLi78Qg1XnPGeq+VtH9y6E9OjPx82Sns2+4DNAblzALu6cm2vuiZr8lNywB+jveSGYG8aJ3faH37+4bFDBPxyf3O4pmC7DPTJErK5yWzdENt+8gzmVcEKbLNc3KMM8aHYXMNYF9XHLiBzsXKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=westermo.com; dmarc=pass action=none header.from=westermo.com;
 dkim=pass header.d=westermo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=beijerelectronicsab.onmicrosoft.com;
 s=selector1-beijerelectronicsab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/iOuX0ThF9UUI1qHonXeDkI6VngCaUVeMalA+HQrFPQ=;
 b=raab+w/iGihk1HTFM4va6RxsjqCj45e/UbfRTYAaKFngQhkNAln7Ihu3jaRNoAlmNViOoPLRg/pjWUIBwm0+tQ4v4sXzUTcRUSBLb9m3AfPK7oH+YGwTH8hXBEdNAx+RBx6W7f/lbiHPwPvORebG7zVE8AdDHk9I8kIrDQyQN+U=
Received: from AS8P192MB2240.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:63a::18)
 by AM7P192MB0692.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:14c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.29; Tue, 12 Nov
 2024 09:10:49 +0000
Received: from AS8P192MB2240.EURP192.PROD.OUTLOOK.COM
 ([fe80::bee5:29b7:49f2:cf70]) by AS8P192MB2240.EURP192.PROD.OUTLOOK.COM
 ([fe80::bee5:29b7:49f2:cf70%6]) with mapi id 15.20.8137.027; Tue, 12 Nov 2024
 09:10:48 +0000
Date: Tue, 12 Nov 2024 10:10:41 +0100
From: Alexander Wilhelm <alexander.wilhelm@westermo.com>
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>, Ivan Mikhaylov <i.mikhaylov@yadro.com>,
        linux-leds@vger.kernel.org, "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Add LED mode behavior/select properties and handle
Message-ID: <ZzMbkVbPu9I6sLby@FUE-ALEWI-WINX>
References: <20201209140501.17415-1-i.mikhaylov@yadro.com>
 <20201216224118.GA31740@amd>
 <ZzMPr3TlEErExRqr@FUE-ALEWI-WINX>
 <fuk5stahnpinahhyixdgeepchucvfbha3ikqagewxhxlh5337x@zuo46w4enzp4>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fuk5stahnpinahhyixdgeepchucvfbha3ikqagewxhxlh5337x@zuo46w4enzp4>
X-ClientProxiedBy: GVYP280CA0035.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:f9::28) To AS8P192MB2240.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:63a::18)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P192MB2240:EE_|AM7P192MB0692:EE_
X-MS-Office365-Filtering-Correlation-Id: 076c1531-8b5b-428b-2040-08dd02f9e5ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?KeVgCJOPZA4KcYDNPT1YrmltCrbB5EjX2eOpBRgfRvy+sP5FJaZnlyZVmh?=
 =?iso-8859-1?Q?Qx8gBg4LkSeGYW8nni70MCVl9J/NMCXSK4UZWWLzclQMOsGzvphmdZciBa?=
 =?iso-8859-1?Q?TKkqUSS5Wl3KXhnAQlaZ1O7Z8tdQ1Sdn7uV01xRt7BwxvrGQrVXAWsyIHJ?=
 =?iso-8859-1?Q?UAj4ih7LCzBo/uv1M/9gizag4AtmBoLztbgst6W2PAmEnfS/6vt52iIrIm?=
 =?iso-8859-1?Q?ISMU8aKZFlp8T/zFNUhp8NrCGekm2Yl60vU9lWB6HXhESlZM1Tw2+7MFcx?=
 =?iso-8859-1?Q?YFd3+nMZqczoQPY+cRnm4/9Vro1v0uy3a/DVZwbYC4A3/NyyVzhC2f5cbV?=
 =?iso-8859-1?Q?ARy2GW3T+qmCQpXui3KDn0n+ZXMOmm2QnTT0q8jnI1zYbovsM9Yagn7fdO?=
 =?iso-8859-1?Q?odoFjnX6IODcfHA/7WiW7We5Uqr57RbRNyOJUQ42sFXONfocNBwPW1zwPO?=
 =?iso-8859-1?Q?Odbr6OCq5xcNFnmNreOtOwxCxEPFayhPIGbJ2M3Z3SEsXvd1SUPpsOA2KB?=
 =?iso-8859-1?Q?so4ouCf9+x0cUpALKTZWAUpjsarKNpEuogFO9sBf5qTawZnNf5gJBxcuAC?=
 =?iso-8859-1?Q?8dujUEfyuObgmpmoC2FK2zvROCxdX/OWiPNHQR/iH4YyjK8ED54qbRijZh?=
 =?iso-8859-1?Q?EPMxJ5D8KNKcXhPSTVeomLxBVk/juc9EYzr7qleJ6PlU6xfBZZ4+i9CUPC?=
 =?iso-8859-1?Q?opnDbsstGqZkSxBfdKz1frRyIhy7qnTpfCHP/38TBjuo5Rm4Z23mYg4Hdl?=
 =?iso-8859-1?Q?dOKvJ/4OlmDdiz3Ys0CRxV15HtHKkhKto8umIjKj54V9Rli/SnkhfjR4zU?=
 =?iso-8859-1?Q?mw5E5mbDvB15BBwdEcvDyAMwBZwmnkI43lQXYj8UDkU+gyrqyKYiRTD9If?=
 =?iso-8859-1?Q?Sd4vMjrnIZWfdgHOs5eQt07ESCMahnrV76PgQPiMu/5HElCRxJaoZWvUPh?=
 =?iso-8859-1?Q?PzVFin9DlBEMOJTOvEfzvW76RK6qMoAHujTMKXnYMaZRcIQmvAirBMgmWb?=
 =?iso-8859-1?Q?FxPUaotswJHf6aNyS+ksUW854+3qQrW7sHpw5KBr+UAtYJG6KyIgYPaVbV?=
 =?iso-8859-1?Q?OB8nvM4AMvvekZUzAC+rZK/StjZBSeCtdg2o/v0mbKoGd/+Nzbq9OBaeCR?=
 =?iso-8859-1?Q?PepIxyx4LVSao4oEPI9FTemkAIUM0fV2wVZrEM/+gPSmrZic6IXj9mlTam?=
 =?iso-8859-1?Q?hi9bxqDZu9PM8mIwZuFYNo06w2sy6unW6Soypfyg7K3S65B0IthBHqPusj?=
 =?iso-8859-1?Q?PtzBWgRsvzXt9QuxRosasktCLxFI7c+T82qqaX+6y4F0wPbAa8PglfTgXC?=
 =?iso-8859-1?Q?KTfWzsDgoua3BWzti5iZWjPiwmDpg9Kcz/4bmFo1J/qG2HV1mdyu8HrOGS?=
 =?iso-8859-1?Q?YJnZufQWpv?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P192MB2240.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?N1BHZnF7+EfxQnHdj8+HaWaHMlVF1mhWaaKv//pY1dQEIcZyuFpj5t/u1I?=
 =?iso-8859-1?Q?yJHJGl/iRy3a/t2SP44Up9P3Ek1fYa2fH+IqEWggwd9VySvrytFi5ofQ2C?=
 =?iso-8859-1?Q?a10iR46nAOlrgeahXJw7n8IyHkiWDCxPVTNRC4IyNxXXbzYMWcjSqUZ9io?=
 =?iso-8859-1?Q?UKfi46Xn/PvxhAMomKfm57RtsTEHP+HQ3tAy+meLZRdtNc+YE9bwHVZblC?=
 =?iso-8859-1?Q?slrXG8mU4T8RegKkrqoOE/VjX0Cqa88UCt1TU3f2KYepKa9vVUasyOCUXG?=
 =?iso-8859-1?Q?WSnZm7j2sYYVpBzKzyhzNJSNh67WcmwW5KBAW8o5xHTp5i3ExBRBAiYnKU?=
 =?iso-8859-1?Q?W5mMMyLGu5lD+GHdjH6/DNOQm8LvUIO5UTi++zzhD1sy1FKJtYwRVg4SKi?=
 =?iso-8859-1?Q?WLI92ZAXSpJ2NpcZNOA4iMloT35LIXikO1AfZkAykF5uKHynu0+XZcDNbV?=
 =?iso-8859-1?Q?BsGYFbMk2U/WFjAuSTdEfGv8x7ho2ED3KETWuZIVNQ9lBTxN0qP2krzvpc?=
 =?iso-8859-1?Q?+d0rCRL8Hf6EFlSII04ld//Tm8Ft2YJS3GH3uWiNxKK4OUMydKl/aM8drr?=
 =?iso-8859-1?Q?zUa8LOLWDig2QW9iMbRpHAgq+jsqgaqnrOQh+DeGgI8bfDulO1ARBAYfya?=
 =?iso-8859-1?Q?af5ccBspkIZu4HTRv0iEG0cgZOo2weUXV0aZKXcZm86guntNcudgta0DWW?=
 =?iso-8859-1?Q?ecQkc0GsaKdb7WwGbPJqOTh9Cv3rmYn/s/QcFT36No9kAt7pGkOMkzhSD2?=
 =?iso-8859-1?Q?ADG/uCAyxPDEiJD2s1qeXIV7h+4JG/S8HChb+pZCmiGdG+jxNXeb7LsSXe?=
 =?iso-8859-1?Q?XrH5ZRjXN1pGxQMOK8/T5qrNv2ExqlFdEZqj/eWpjuD+fT/lx0L/HT5Ja9?=
 =?iso-8859-1?Q?i1Cyt9SisoeCKH8GxcLXeHU7srpSRy0QQRrQoqdh3vrWewycXEptfj6HIS?=
 =?iso-8859-1?Q?3OO2KOUJHCbdpGEXFZv9OpfII2NfP7NpCUOlSYzmBwArn9+pKBsaaACTr6?=
 =?iso-8859-1?Q?FXfBJH4v9ExqrLQanV7G4tEuxW2q8D5olomdmjh+MN2eHl91aTanNS9Fvh?=
 =?iso-8859-1?Q?JvBUdyOrHuURRQ70jnRwlBmHnJx8l7QKJRXl9zsN1KA4u3C0Mh6FPnqxRQ?=
 =?iso-8859-1?Q?vvE7TyhdO9qjeLW6OOuJufp0osJImGt5Qz5D3mTM+wYIWlmLSSYqryadg0?=
 =?iso-8859-1?Q?2COfoXkcuCbgUQJH2wkC91wkivqgCT/pN0B9CO/viBtz8OMq7aRHEy5uwL?=
 =?iso-8859-1?Q?BzO8ITTjdisznXAQjpRhtvYYlB4aEFz6wxpsYmwlVukof4A3xU96RrOz7U?=
 =?iso-8859-1?Q?5KQyfVvNf+Z/t4w2gL9aXhMMGeyJI5J8I5CcVdqTtJ/ga1F0PKjWsYJSl1?=
 =?iso-8859-1?Q?WomnKuuy0VRnzTCJWwQYBFWgWQRjBw+o7yqIQkJ3mpnvZcnJRF/bh1q+XC?=
 =?iso-8859-1?Q?y9e0Cbdly74V7e0gD+6QggqO6i9IevmzB8AYfQcTrHbsYRFegrRvnkmsN8?=
 =?iso-8859-1?Q?I/k+XADQ6EdIRee9IeHM6CDQ0OKivoTv+JHEs2tNroapjzm4C0rMogfA7q?=
 =?iso-8859-1?Q?jC91nMM+ZqZBHEJd/L6QU0QrYV8udBb93CEsTbT7KXGbf3Jhz+RZUvZpNS?=
 =?iso-8859-1?Q?Xw96IIMyGnJ7yoQtFbVTp9wxDSzH5sF6Ke?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	2TzzOab8eU3aer1ZGyZTncd9+mmg3itjnEiuqOoYOUq75D7w0FjscVBBp2ka9C/tlY6T31CPuRdeJ2idhk21G96x+McJfD1E/oObMuEVV/72MN/dxsYxV9z8woV5LyNYbrfXwq/jpDmrhw0nTbOemcs0ppDYkTWj6OsnaSN+MqlT2aR3xzoGWqR3rcpMG0GpZ0Y3HHJQp56Y5eDRq9/sP6G4Ov2nYJMyK7tU0ohyooFQerLDi696+xv70ec9h2tqQkPB0W71vLx+09Nk23sat67KS3hctJNp6NWiFiNYHj8IfLLzj3Kf9w8NJfW0Oli9C5xU1Ewm4YoHSD7B6JpHINMz3x/TeHxbSE4AsZfMMTOuQdGjATNu4Chs6DW+5Mv7HKkyQK74pQY5p1j1incH1pA+XLOnyfu0jtD1nedRnoWeejNQVrkbNytQsCoj3J+iSodMFrTMYvQNPS6N2OhCCek0tcRtrHprHn9nTBr0BD5sn+imTeJyARWvEH5Ur6ck/eSbjnN5AC+YyLXsGjbxLpneHNTsfKtX3C5XcE1DoDT7gupKl8WDhoiDbrD5hXH74U/vgFrugM4S4eCkaVx0oXXo8FuZCdvHtQ/qYR3izBT8fRcuWcmIAhRSwiaYy9PG
X-OriginatorOrg: westermo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 076c1531-8b5b-428b-2040-08dd02f9e5ef
X-MS-Exchange-CrossTenant-AuthSource: AS8P192MB2240.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2024 09:10:48.7570
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4b2e9b91-de77-4ca7-8130-c80faee67059
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5VYF0QxeiLaQY4E55zhl2RhC9wVKC/v0l58t/QdS/EtL/ibD4+qANWNso10kdBFy5r202+4sFW/YAaqXIaN+BQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7P192MB0692
X-MS-Exchange-CrossPremises-AuthSource: AS8P192MB2240.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossPremises-AuthAs: Internal
X-MS-Exchange-CrossPremises-AuthMechanism: 14
X-MS-Exchange-CrossPremises-Mapi-Admin-Submission:
X-MS-Exchange-CrossPremises-MessageSource: StoreDriver
X-MS-Exchange-CrossPremises-BCC:
X-MS-Exchange-CrossPremises-OriginalClientIPAddress: 104.151.95.196
X-MS-Exchange-CrossPremises-TransportTrafficType: Email
X-MS-Exchange-CrossPremises-Antispam-ScanContext:
	DIR:Originating;SFV:NSPM;SKIP:0;
X-MS-Exchange-CrossPremises-SCL: 1
X-MS-Exchange-CrossPremises-Processed-By-Journaling: Journal Agent
X-OrganizationHeadersPreserved: AM7P192MB0692.EURP192.PROD.OUTLOOK.COM
X-Proofpoint-ORIG-GUID: vHO3AQ5kyIXuTllAqDYEjTFgQpo4y8MT
X-Proofpoint-GUID: vHO3AQ5kyIXuTllAqDYEjTFgQpo4y8MT
X-Authority-Analysis: v=2.4 cv=U47ADvru c=1 sm=1 tr=0 ts=67331b9c cx=c_pps a=9TK2mEVt+YNFxHG6VsEebQ==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=VlfZXiiP6vEA:10 a=0HJ-WiGSmKEA:10
 a=8gLI3H-aZtYA:10 a=zol-OXSRhdHES_UYJygA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10

Am Tue, Nov 12, 2024 at 09:49:03AM +0100 schrieb Marek Behún:
> On Tue, Nov 12, 2024 at 09:19:59AM +0100, Alexander Wilhelm wrote:
> > Am Wed, Dec 16, 2020 at 11:41:19PM +0100 schrieb Pavel Machek:
> > > Hi!
> > > 
> > > > In KSZ9131 PHY it is possible to control LEDs blink behavior via
> > > > LED mode behavior and select registers. Add DTS properties plus handles
> > > > of them inside micrel PHY driver.
> > > > 
> > > > I've some concerns about passing raw register values into LED mode
> > > > select and behavior. It can be passed via array like in microchip
> > > > driver(Documentation/devicetree/bindings/net/microchip,lan78xx.txt).
> > > > There is the problem in this particular driver - there is a lot of other PHYs
> > > > and led mode behavior/select states may intersect, that's the reason why
> > > > I did it this way. Is there any good ways to make it look more
> > > > properly?
> > > 
> > > Lets... not do this?
> > > 
> > > We have a LED subsystem which should probably control the LEDs... so
> > > user can specify behaviours at run-time, instead of them being
> > > hard-coded in the device tree.
> > > 
> > > Plus, LED subsystem will use same interface for networks LEDs as for
> > > ... other LEDs.
> > 
> > Hi Pavel,
> > 
> > I would also like to control the LEDs via subsystem interface, but how I can
> > configure those to be visible in 'sys/class/leds'? My LEDs are connected
> > directly to KSZ9131RNX phy device and not to any of GPIO available on the CPU.
> > Am I missing some DTS entries therefore?
> 
> The KSZ9131RNX driver needs to implement some LED methods, like
> .led_brightness_set(), .led_blink_set(), .led_hw_is_supported(),
> .led_hw_control_set(), .led_hw_control_get().
> 
> Look for example at marvell.c driver, or broadcom.c.
> 
> Regarding DTS, look at linux/arch/arm/boot/dts/marvell/armada-370-rd.dts.
> The ethernet-phy@0 node has leds subnode, describing the LEDs.
> 
> Marek

Hi Marek,

thank you a lot. I think I got the main idea how the LED interface intended to
work. The current linux master does not implement those callbacks for the micrel
phy. I will look into implementing these functions if I am given enough time to
do so.


Best regards
Alexander Wilhelm

