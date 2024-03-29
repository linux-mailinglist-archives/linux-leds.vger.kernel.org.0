Return-Path: <linux-leds+bounces-1376-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01BAF88FE6E
	for <lists+linux-leds@lfdr.de>; Thu, 28 Mar 2024 12:57:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 331F81C25349
	for <lists+linux-leds@lfdr.de>; Thu, 28 Mar 2024 11:57:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6241D7E57F;
	Thu, 28 Mar 2024 11:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bW9WXA0V"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3862C43ABE;
	Thu, 28 Mar 2024 11:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711627052; cv=none; b=oitU3ssk5x0Wvsm2Wslqc9wtpoHivd7ugE1ixbikyLfG8agRvH6SD1Fqvlfl43jdrcj0DKQDAJN4qzabqBljiiGmOX/+turgK6rUnBD93zwZDExobmhGuSVxyCQpstnPYzvsOWEtvK3Vm3fdzMvqmzGyoJygFUEJ3yezPzneFbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711627052; c=relaxed/simple;
	bh=64P0HBrfHBSQY4VcXPfTyJICSzTfeEDo2oupPZJVBMc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=cYWYYJlXQpcDmDvEfdt+DqjKhngQZd76iNozIe6CEfLfI594P3z5nEHIrY2s+SQHdce+EiFsmMEo+MCrBh+NfDZGP7cNJxTMCGzZsFgldgrDesPrkk7FM03BQ+zRP6dEJt//ZR4hfBGaGYDJp7j5EpmsZ6xy8+JEJVOquf69800=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bW9WXA0V; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02FFFC433C7;
	Thu, 28 Mar 2024 11:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711627051;
	bh=64P0HBrfHBSQY4VcXPfTyJICSzTfeEDo2oupPZJVBMc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=bW9WXA0VaLxoVYD59peOxcjrvOk81J3xzXZzEq4JxLGRFHV5cG62nrpQkKa4wpaKC
	 cMmjH20c8vo6mJpsSqYwaxP7mtV2eD/o5tGrvdFI3qaX59pt1+EHg1B1HWcqEQNdBA
	 lS4J0sFtjloKxg/iBcRH39H9bXgDTy4XABHf5xYwQX7q1hHa/q8XKckjrSa+u+uR+q
	 DAkpWpL3jo4elrjB7ZGw3e9qYqG9G8JeXwTcuMSgSX2jyBUAQyxTt47nd4skXlwOV3
	 1e3tAs1HkZphKIqL+OHX2niONakBMmSYqeSmjj8VTgUFU/ERnULN5tXw12D8VBWnNB
	 873olkhN1fJwQ==
From: Lee Jones <lee@kernel.org>
To: pavel@ucw.cz, lee@kernel.org, robh@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 INAGAKI Hiroshi <musashino.open@gmail.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240323074326.1428-1-musashino.open@gmail.com>
References: <20240323074326.1428-1-musashino.open@gmail.com>
Subject: Re: [PATCH v2 0/2] dt-bindings: leds: add LED_FUNCTION_* mainly
 for router devices
Message-Id: <171162704973.1976766.8383604452247666252.b4-ty@kernel.org>
Date: Thu, 28 Mar 2024 11:57:29 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.4

On Sat, 23 Mar 2024 16:36:08 +0900, INAGAKI Hiroshi wrote:
> This patch series adds some LED_FUNCTION_* definitions mainly for router
> devices.
> Those definitions are useful for OpenWrt or something.
> 
> v1 -> v2
> 
> - fix sort order of LED_FUNCTION_MOBILE
> - improve the commit description of the first commit
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: leds: add LED_FUNCTION_MOBILE for mobile network
      commit: c332f0450f33c123a538a8fcc69fa8e4e5aedfbb
[2/2] dt-bindings: leds: add LED_FUNCTION_SPEED_* for link speed on LAN/WAN
      commit: 2588a5d98532244a7faf4514f79dc684fddf4c14

--
Lee Jones [李琼斯]


