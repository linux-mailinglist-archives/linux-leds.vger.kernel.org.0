Return-Path: <linux-leds+bounces-5804-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DEA4BE7565
	for <lists+linux-leds@lfdr.de>; Fri, 17 Oct 2025 11:03:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 88E513B2C67
	for <lists+linux-leds@lfdr.de>; Fri, 17 Oct 2025 09:01:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF0D828750C;
	Fri, 17 Oct 2025 09:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="hRwzDNd4"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22A81E5714
	for <linux-leds@vger.kernel.org>; Fri, 17 Oct 2025 09:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760691661; cv=none; b=NVsTf0v4eJvOgdqjh7tu12aLI3hgz5k7/+5Q6T9EYgE1j1Wqpbd3VGQiMLZ5b08c34rAPbnS7fgYaI88AZNv82LZAt8/PasVcqdIXOy5zUwk131XM7T9bTd99RsZm14KUcVPEnsNw7DxPenfuRW/qzYqocsLzM4+os8Iikz1Hyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760691661; c=relaxed/simple;
	bh=mY3OvQ3rYUK5KdTmwUtH6nyQZzxPGP/sqEDsajp9PMs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C2Hr1m0kl8lGvhjaEvaPCUNFgcTUyxstHtZoDl4td6EG7TuT9xCFDt9VYqZECLrVNfbulwHvjweO41IMRv92eoQWtDb5IhHyEvzmN8HpsWukcE7JJop0ZQ6xUFnHVibQl+hwOh/Yx6GtySByqLN8ujWcHvjbhhlT7cwk7zikYSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=hRwzDNd4; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 4A4B51A1460;
	Fri, 17 Oct 2025 09:00:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 20BAE606DB;
	Fri, 17 Oct 2025 09:00:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 57E4A102F2342;
	Fri, 17 Oct 2025 11:00:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760691657; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=ch81BcX9X3+I94fyKG6pbtXcoNAUDjd0YkMmgRQ8ReQ=;
	b=hRwzDNd4IM+PEVEZqDL3YELnlExz95C1x01qGbNRO1TObU4ojXT45HLTqOT1HsN7Q+iUrS
	fJbnhym8riSwpCIfEHXQarwS/vnzpcaglHTm1xBkQKff8C1CIMX+jg759ALjAvrTBh6hUd
	T9VPq3XxSt0GABT2tYHtmnYNRvwGGpz2MeoS92e90Ku4FSjvNJfRt6WIIhZ2LrUTJfp1+4
	dEu7SOHQArLSKndmX5xbU0aqI81Rq3DlnzfH9LH6bIiwNuB88E1EhzofhjtrgtlJolrj8o
	veVQQ7z2wkSo+/Uq8zkwL15xVHswpB6oJzIuZhQTkL89P9VfAvIaQi9p5/JBRg==
Message-ID: <690812a9-2f2c-4a88-b6fb-a3789e931d11@bootlin.com>
Date: Fri, 17 Oct 2025 11:00:54 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] leds: upboard: fix module alias
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
 DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw
References: <20251016-leds-upboard-fix-module-alias-v1-1-be63bafcf250@bootlin.com>
 <44d6ea9f-8559-464d-ac39-20495375bf0e@kernel.org>
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <44d6ea9f-8559-464d-ac39-20495375bf0e@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 10/16/25 9:11 PM, Krzysztof Kozlowski wrote:
> On 16/10/2025 15:28, Thomas Richard wrote:
>> Fix module alias for auto-loading.
> 
> Fix what exactly? It was a completely correct alias. Please describe
> here bug (so WHY you are doing this) not what you are doing.

The module alias does not match the cell name defined in the MFD driver,
so if the driver is built as a module, it is not automatically loaded.

Best Regards,
Thomas


