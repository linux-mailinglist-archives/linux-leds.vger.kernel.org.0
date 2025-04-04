Return-Path: <linux-leds+bounces-4402-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9ECA7C022
	for <lists+linux-leds@lfdr.de>; Fri,  4 Apr 2025 17:03:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD005174E18
	for <lists+linux-leds@lfdr.de>; Fri,  4 Apr 2025 15:03:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C55C41EF368;
	Fri,  4 Apr 2025 15:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="Ui3IjQva"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-18.smtpout.orange.fr [80.12.242.18])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1DA1DFD96;
	Fri,  4 Apr 2025 15:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743779012; cv=none; b=IfmvBooEQC1LRXgE6r3wd0YduCmaMosteehu+4t4Ye+Ogv+OjEN0AOWa6rns9ddB3MVVp64zbea25u2EuSNFRwarPMA2EubqdDvIa2uSwHWUzHglJX7t2SRKyQo2rd/9Ff06eOQXKzWOATjIZEgPHI5KCky2YbqitdvD+YomUWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743779012; c=relaxed/simple;
	bh=Vqld1k1EanQqrRXMnKxKlA0j8qbBI1c4ZSiKwVV38Pg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rTq2OOxPZxvSI6FhKg1RWzC+JV5TKzLr8vJSDU4mU4dXMXUSmUbJ5NsNDqM+GWGM/2z0ZbwvrSxdVPpyE4HzMJgEDsYwpNuSzgLdYMkxVCZU/aMUQSgszbazIizFYXQVLUZ5McpKVDQa/UPzaiaT3/XctRgOjQzJgIMXmHw9Fro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=Ui3IjQva; arc=none smtp.client-ip=80.12.242.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id 0iR3uAdvnEroE0iR6uXbk1; Fri, 04 Apr 2025 16:54:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1743778466;
	bh=Vxe3vXGex7NwadU5R8+v9L4U75CtPL0nqPRxaiu24j0=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=Ui3IjQvao55HGypaHwZMvMentJwuTYqqQax5pbxZvDEYFveIQUi5iluKjkjN6Q1lC
	 TH71h9Jmqo8Mw6ojzKX7zV7LfTQcZENtE8EkjusFw/TIwU4XWPVTeMktdtkGa/yrB1
	 jo6N4iY/OrjyfMxGDAf+wmstJcdjnn6ybScnwM6DNgHbip7sk5tggZC5WAF1OtemE0
	 Xq+eUYG3u8xM9k20S7haDi5AOFEXwTaoOZ8DrDl2z48zdxmNQAOfzlZhXfze/SubI+
	 WEd0goIi2A6E7NkqhuFjHlgMzUTlTquRBkRcb6KdnyqLHriqMUicPiGGZIDnC+Low/
	 lqG8K6i45/Pfw==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Fri, 04 Apr 2025 16:54:26 +0200
X-ME-IP: 90.11.132.44
Message-ID: <ec9810f1-a830-4a9e-b573-4003f94259df@wanadoo.fr>
Date: Fri, 4 Apr 2025 16:54:21 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] leds: tlc5928: Driver for the TI 16 Channel spi LED
 driver
To: Corentin GUILLEVIC <corentin.guillevic@smile.fr>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
References: <20250326153535.158137-1-corentin.guillevic@smile.fr>
 <3be3ca59-157d-4ceb-81bd-4a1acdbccb9c@wanadoo.fr>
 <CAMFqQmpJB4WeOM7GF1dEuJDb27rf=CBC4UuROWA+AH2+ZbJE8w@mail.gmail.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <CAMFqQmpJB4WeOM7GF1dEuJDb27rf=CBC4UuROWA+AH2+ZbJE8w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 04/04/2025 à 15:54, Corentin GUILLEVIC a écrit :
> Hi,
> 
> Thank you for your review! I've fixed everything (new patch is
> coming), but I have issue for some of them: I can't use the suggested
> functions (guard(), for_each_available_child_of_node_scoped() and
> devm_mutex_init()) because the kernel version used on my device is too
> old (v5.15). No way to test with a newer version...
> 
> Should I let the "old" functions because of my kernel version?

No strong opinion on my side on this.

The proposed changes were just to have a slightly less verbose code. I 
guess that having a tested code worth much more than using some 
convenience functions to save a few lines of code.

Let see the position of maintainers on it.

CJ

