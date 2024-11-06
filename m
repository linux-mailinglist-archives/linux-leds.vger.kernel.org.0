Return-Path: <linux-leds+bounces-3299-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 546079BE11E
	for <lists+linux-leds@lfdr.de>; Wed,  6 Nov 2024 09:37:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F2F9283470
	for <lists+linux-leds@lfdr.de>; Wed,  6 Nov 2024 08:37:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0CA11DB522;
	Wed,  6 Nov 2024 08:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C6AzekI+"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54261D47AC;
	Wed,  6 Nov 2024 08:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730882141; cv=none; b=QtSzhDt5FC3UBTiklX8rbk18YIdnSltDp/TnC5Sbm4M2NeVmkHA8WwJNS3T6qjZti/gb/A866oSTJJwL4YAlAjlD34U10IkykBSdQ9IQzVM30crjPgRtAs/eBTbPHRWERo65nb+/uzDboCaZguPleuATrQ3qnYfKSMOznPPftNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730882141; c=relaxed/simple;
	bh=N9L3f39LVnSxyrSgJFD5OMkM9xnQm7GyL98QzitsJOg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=p5bEpY9w2AyvnhmGBw/kciv2nYfrMWfpZmcqUqZzGZFLTPRx80hI1vW2RL9Vtn5oEzpC1JbDwPmZ824/Ul5pNmR/msQ3Y6lynjehFVvIudFk7c3NSTPN8dSgHRFpc0AxZyjd9dv67La5E5H0Uy39RzVNo2u+Qz1k1RHnY3pxflg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C6AzekI+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B902CC4CECD;
	Wed,  6 Nov 2024 08:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730882141;
	bh=N9L3f39LVnSxyrSgJFD5OMkM9xnQm7GyL98QzitsJOg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=C6AzekI+pfUY3oHl/dIjxAJ4cjxI18w7tIUGXuLVkJINRxV13zpjI5ANvWymn8JpV
	 0wztrXupOfm/CXnXeyfLVsOqxzjFsvLhhyGjot6Xa3vD18+1CVaRtKO5j4GPtXeIUN
	 pHYnD5OgR5LU6FhVQIIyZL1HZ2ZtsYbq701TGgia6vu+XTszRdKwK1R+kgxlkee+Z6
	 Ta77/ETuir6M/E+Urf9VYyskOUeoVK8B+P4qzRd/KS6Cv9nmYnoNv07sKMr9qsMOoR
	 nVFX7Bn9G0DR4hhKXAubZubF48RFPxbF8Mqvwj3YHvzrLFJEo92/yvRNLQ6R16Gf0l
	 1TkQr+TVjTXjA==
From: Lee Jones <lee@kernel.org>
To: linux-kernel@vger.kernel.org, 
 Raymond Hackley <raymondhackley@protonmail.com>
Cc: pavel@ucw.cz, lee@kernel.org, krzysztof.kozlowski@linaro.org, 
 duje.mihanovic@skole.hr, daniel.thompson@linaro.org, 
 linus.walleij@linaro.org, u.kleine-koenig@baylibre.com, 
 linux-leds@vger.kernel.org
In-Reply-To: <20241103083505.49648-1-raymondhackley@protonmail.com>
References: <20241103083505.49648-1-raymondhackley@protonmail.com>
Subject: Re: (subset) [PATCH] leds: ktd2692: Set missing timing
Message-Id: <173088213948.3248329.10549504992077467020.b4-ty@kernel.org>
Date: Wed, 06 Nov 2024 08:35:39 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Sun, 03 Nov 2024 08:35:16 +0000, Raymond Hackley wrote:
> props.timing is not set after b5a8c50e5c18. Set it with ktd2692_timing.
> 
> 

Applied, thanks!

[1/1] leds: ktd2692: Set missing timing
      commit: 95c65546f03f888481eda98b499947252e1f3b20

--
Lee Jones [李琼斯]


