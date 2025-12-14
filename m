Return-Path: <linux-leds+bounces-6413-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E060ECBBC9A
	for <lists+linux-leds@lfdr.de>; Sun, 14 Dec 2025 16:35:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EB4BA300763E
	for <lists+linux-leds@lfdr.de>; Sun, 14 Dec 2025 15:35:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D9812D063E;
	Sun, 14 Dec 2025 15:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fw8nQavE"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E292EF9E8;
	Sun, 14 Dec 2025 15:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765726515; cv=none; b=ARevShUKL2Nh9L8mhYFVmHXrEjti3ZrZvwE02hfliF08yj94V7PBjmseANenacX20Qudx0c9W4dPjTiEANqpZVt2rWS/TH7t8I9zWj0ACO/07eeBZ5PEYbRop7ujENqON/X8mdQedqiFHUrOy6mkQoOFNLVDdtD0yJuvU0Wvn28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765726515; c=relaxed/simple;
	bh=AC0Ciwe3PEuDgmmeEkF1W546sse6CnA0wCHL70t7nUw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=N8DQ4lXfrcz3dDlFppnmutViuHgj+KVF08b2CZ4AKwWR4yTjA9S3bcc3K/JbWrcT+FE0ndHDIZlNsC+gH6UF1q1Y1op5jUGdlIOUY8b/r4LwJc/80QiQS1z8W+q/Li5kJCPI8vppoWfVwBdHrNkN4y7YTyrvWmWT/V1tgjL9H6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fw8nQavE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F0E8C4CEF1;
	Sun, 14 Dec 2025 15:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765726514;
	bh=AC0Ciwe3PEuDgmmeEkF1W546sse6CnA0wCHL70t7nUw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Fw8nQavEWYc9KQQwdhwW16DvxCvi7sCJZGjzXmsr8C58703xOypILkwAVBTkt2M+5
	 lAcWUQFhvyMkIXDAbmClzZTxRvIuYivlednyUuV/PbzdRDMR+dvQkPvfMPWGE9j1nB
	 aBKypB6ZM4KuzJWSjf5Nlm3QuAW0gxfWQ+HZ9soMt3UYbtuIy3dctrNAvfcekdiuzF
	 8dZ/4Jibb9tEF7UmP4v06DUb77+RUcefLm9TkTJ7OUhLPg6lmVj9raOBRrP436RCiX
	 wggGyJw3lmxb8aX1Q5cEQqzNEKmQaCVlN/ZLD1R6brLTVK2aVLp4Px7TsfCWv2D85Y
	 a7tRmlHO1NpGQ==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org, pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, Lukas Timmermann <linux@timmermann.space>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20251125114015.355487-1-linux@timmermann.space>
References: <20251125114015.355487-1-linux@timmermann.space>
Subject: Re: [PATCH v11 0/2] Support for Osram as3668 LED driver
Message-Id: <176572651204.304949.14632935583958995926.b4-ty@kernel.org>
Date: Sun, 14 Dec 2025 15:35:12 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38

On Tue, 25 Nov 2025 12:40:13 +0100, Lukas Timmermann wrote:
> This patch adds basic support for the as3668 driver IC via I2C interface.
> The IC is capable of driving four individual LEDs up to 25.5mA per
> channel. Hardware blinking would be theoretically possible, but this chip
> only supports a few set on/off-delays which makes using that feature
> unfeasable, therefore my driver doesn't offer that capability.
> It's intended applications is in mobile devices such as phones,
> tablets and cameras. This driver was tested and is working on
> a google-manta which is running postmarketOS with a near mainline kernel.
> Also there is a patch in the linux mailing list for that device:
> https://lore.kernel.org/all/20251120201958.1970828-1-linux@timmermann.space/
> The register names and values are taken from the official datasheet which
> can be found here:
> https://www.mouser.com/datasheet/2/588/AS3668_DS000196_1-00-1512816.pdf
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: leds: Add new as3668 support
      commit: a093bc82b6013c40add22b96deed4d2b67905f41
[2/2] leds: as3668: Driver for the ams Osram 4-channel i2c LED driver
      commit: 8856d7fe1758937ac528770f552ec58c388c255b

--
Lee Jones [李琼斯]


