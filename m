Return-Path: <linux-leds+bounces-3737-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD00A07333
	for <lists+linux-leds@lfdr.de>; Thu,  9 Jan 2025 11:31:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 495FA1627C6
	for <lists+linux-leds@lfdr.de>; Thu,  9 Jan 2025 10:31:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49AB3216397;
	Thu,  9 Jan 2025 10:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z8z8+7V9"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D1221638F;
	Thu,  9 Jan 2025 10:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736418650; cv=none; b=LHFaImek6QIpUDJ/ZqvKkbORNCgGiVfC5OJ0Tggjx0hCe1LXdIPNy1E0kEEPQPJrfpf/1Dx3oNHa5f70wj79ccqBZN0zLuopt7fhVHupMn8y81Hlhy7mV2ti56W3bkNfkemMMRPFRNhI/O6p2Gmhk03mNI3huSnejkvDPdx+Qw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736418650; c=relaxed/simple;
	bh=LpHKm3VoRFHrgXNGAvMXKjF/2/qRgIuKInjVQdY+I0U=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=p+SqTpGqJql2r4+ZgN5b6FP9R+YCQvHQiBWkXnArF0TjMPvOJm/rN19NW3zrGgfG1fFLzPGZoPSJxUdnDNNSZo+UmXRwetRlUcc4hDteSA0aSbQgCPO0Eib97LJsbbVSuzlOl/sSh6BF9OtF3EhlJmI296JHcJChEOrHtfMoLyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z8z8+7V9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC086C4CEDF;
	Thu,  9 Jan 2025 10:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736418649;
	bh=LpHKm3VoRFHrgXNGAvMXKjF/2/qRgIuKInjVQdY+I0U=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=Z8z8+7V9n3+lLU34ylxTNnNbuiAFD8hGM7ar4Bn6caMV1Jg25H1S3MkjordB2jjcb
	 NLBbwl52s4q0dx1STDkQFn4Xnh/AeGN6JPGO0VI4Bgrk26jV5rtzQrjBaTgNEamJ4p
	 rVDgjj8JXjc0jwXY3GSIcn+PLDhDCE1kpCRoQcNhVB8IYHiMiZGQeh+RPr19Cf/Tn/
	 2n37LA5Z8G9JiaykFAryL2obvndKfFCG+WIGZ1S27LinYN2KRaAIiEAlo9wlQ8yJN3
	 NjTPmhp4VriwfXEgxpYa/ZUOy1EQNqf7BxgUDL2Ls44iIyQkr1nCXp4RGK7Wsgc9Xu
	 d50iH9f7JcarA==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>
In-Reply-To: <20241218183401.41687-4-vicentiu.galanopulo@remote-tech.co.uk>
References: <20241218183401.41687-1-vicentiu.galanopulo@remote-tech.co.uk>
 <20241218183401.41687-4-vicentiu.galanopulo@remote-tech.co.uk>
Subject: Re: (subset) [PATCH v11 3/3] leds: Add LED1202 I2C driver
Message-Id: <173641864745.2570436.6359371577917683428.b4-ty@kernel.org>
Date: Thu, 09 Jan 2025 10:30:47 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Wed, 18 Dec 2024 18:33:59 +0000, Vicentiu Galanopulo wrote:
> The output current can be adjusted separately for each channel by 8-bit
> analog (current sink input) and 12-bit digital (PWM) dimming control. The
> LED1202 implements 12 low-side current generators with independent dimming
> control.
> Internal volatile memory allows the user to store up to 8 different patterns,
> each pattern is a particular output configuration in terms of PWM
> duty-cycle (on 4096 steps). Analog dimming (on 256 steps) is per channel but
> common to all patterns. Each device tree LED node will have a corresponding
> entry in /sys/class/leds with the label name. The brightness property
> corresponds to the per channel analog dimming, while the patterns[1-8] to the
> PWM dimming control.
> 
> [...]

Applied, thanks!

[3/3] leds: Add LED1202 I2C driver
      commit: 939757aafeb9c266dda37657ee5f7a73ffd35ae2

--
Lee Jones [李琼斯]


