Return-Path: <linux-leds+bounces-3738-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F716A07337
	for <lists+linux-leds@lfdr.de>; Thu,  9 Jan 2025 11:31:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7ACEB18866C1
	for <lists+linux-leds@lfdr.de>; Thu,  9 Jan 2025 10:31:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4C6B2165E5;
	Thu,  9 Jan 2025 10:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W6kOMrPJ"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C262163BE;
	Thu,  9 Jan 2025 10:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736418652; cv=none; b=VKTexKOslIwJDd6v8p4/KGFLkgGOHj+caS3HOFilYLM6By5mb+Wk/2zPvl9/w1oNJl+15ps7fvdOrXMG17gHlp9itUlDeBH6yAmH00FCJa+Y/bOQC4Z08f5LKW1NkcBTZPJnhbV6rA90xq8RrNbj13L4zdVK7hOTmo9du2cPgkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736418652; c=relaxed/simple;
	bh=dxtWlicI1wXcxIew7MBUbA5pvNiBSXtTw+tF9okO5nM=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=MHYVsiXxik8M/Dfz4F8ZWIICw1ToSoizJGhy7zb356IT3zPWilUl5G4OsRpGfdaiT8B92w1NkRy7M6tmMMCSlmqh5jKMj3wiGxnNw+97yZbFifyebpiinJW48CHZmW6uwEsUdtuUaKFHF3kM7lAnBFUyFl371yPkTHnz/8RV+F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W6kOMrPJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B4D0C4CED2;
	Thu,  9 Jan 2025 10:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736418652;
	bh=dxtWlicI1wXcxIew7MBUbA5pvNiBSXtTw+tF9okO5nM=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=W6kOMrPJoefWjiCt5OVqdiIAcBT0K0t/VB03UiO24Z1AIDlTPwqbQD+FJPeX9Ttga
	 iHLtm4Uh9zZzTjWzoESbG3JOZV/HuYzH74/5S0BctD36ibGXq2DcF4Ks14mz+7kZKD
	 okt4qsVod+ORN+UhntWQuU50UaIebQ1N/WrFbMkz7ffB3kp96xTj9XbIJNM2KoNLav
	 z/euaUt16WnalLs464qByWaZwLuLcYY4kBuv54BnKgyNN+1Z+HaeHW+7rPNVmNb/t2
	 gMHAklqXL4DsYxBwnv6Xjrk2YDbWRaZJ+pA2CyVPTP4bFU3OyIp30N9Lh3HPwoz3GU
	 uOP3bvktZOWUQ==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>
In-Reply-To: <20241218183401.41687-1-vicentiu.galanopulo@remote-tech.co.uk>
References: <20241218183401.41687-1-vicentiu.galanopulo@remote-tech.co.uk>
Subject: Re: [PATCH v11 0/3] Add LED1202 LED Controller
Message-Id: <173641864985.2570436.2211678910376085312.b4-ty@kernel.org>
Date: Thu, 09 Jan 2025 10:30:49 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Wed, 18 Dec 2024 18:33:56 +0000, Vicentiu Galanopulo wrote:
> The LED1202 is a 12-channel low quiescent current LED driver with:
>   * Supply range from 2.6 V to 5 V
>   * 20 mA current capability per channel
>   * 1.8 V compatible I2C control interface
>   * 8-bit analog dimming individual control
>   * 12-bit local PWM resolution
>   * 8 programmable patterns
> 
> [...]

Applied, thanks!

[1/3] Documentation:leds: Add leds-st1202.rst
      commit: 132e6687a118cedda0f59ada4af5ce42d0d05043
[2/3] dt-bindings: leds: Add LED1202 LED Controller
      commit: 599b92fd0efa8b7c43e7f58c9dd0f7951f7cbf09
[3/3] leds: Add LED1202 I2C driver
      commit: 939757aafeb9c266dda37657ee5f7a73ffd35ae2

--
Lee Jones [李琼斯]


