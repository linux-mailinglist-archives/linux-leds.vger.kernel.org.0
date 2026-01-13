Return-Path: <linux-leds+bounces-6628-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD36D17289
	for <lists+linux-leds@lfdr.de>; Tue, 13 Jan 2026 09:02:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6639E3048BAD
	for <lists+linux-leds@lfdr.de>; Tue, 13 Jan 2026 08:02:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 224BD36C0AD;
	Tue, 13 Jan 2026 08:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c6rP5VTl"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C29E352C2D;
	Tue, 13 Jan 2026 08:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768291348; cv=none; b=HHjdnIgNqYkuU/UGKc+aWESbhiQ3CHXQjb2t6Et7Anfj+tFsQAlJklAkoK/FN4waQT8kvvjldfvKeHbXBcV8HQQpfln6UsSLo8v3pVIaCdLK+E0yJgz/LbDBLhu/lk9qpgga8/CWPsA9HPoU6y3GOlqa6xupgKboq1tHo0KiUYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768291348; c=relaxed/simple;
	bh=J3hBtI77EfhzmvcrvjNUQr86h+zI8ManKW7DJecFKQY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tpbt3cB0kliEP1uSd5bhBePRFDC/Fh4zS37IPG882K6YKQSG621Up/hpKUW4XMBcRTn8LdZ8yQuinDZ/2dUvSQ8mXJ24e+qb4nv7ARy4tVcmORsqXVq0vms/rBcULF/XAUd4Jaljkzf99Ia0AtkjwLQu64AxtV+rf4lhn8F7+OY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c6rP5VTl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2FC6C19422;
	Tue, 13 Jan 2026 08:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768291348;
	bh=J3hBtI77EfhzmvcrvjNUQr86h+zI8ManKW7DJecFKQY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c6rP5VTl4V97plwwwkx2p3C2XbgPLNTlxq7nUjU/y/FlH1xbQ72V2tyFbLsXFSjMp
	 y7ZIlJ6Nu1kiKqwu/l4PeokQBfkxrWLE0Rjmo16bHZiDuYt5OgvX93jPBzOGKYGxWp
	 7OiuOgSOTk+L7oURS0XNos0bnAgSqFVoxTSiRpoafjdhmP/EAaPHV+fvb9obuSe/bD
	 kHz2K97TPpHKiqNNkiYlZhj6ctcIONi2WevyA63qYwK3Ndt08Dlax2U8PJfl8lczP0
	 gKCFycErKmB5XnUisa63mbIuscjRED3ceZZHN9ECutDNJ8lG/NIXQICfmxQZ6xCtQk
	 /2HRQ7gPcRkCA==
Date: Tue, 13 Jan 2026 09:02:25 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Edelweise Escala <edelweise.escala@analog.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Add Support for LTC3220 18 Channel LED Driver V2
Message-ID: <20260113-remarkable-determined-pogona-bfb2ab@quoll>
References: <20260112-ltc3220-driver-v2-0-d043058fc4df@analog.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260112-ltc3220-driver-v2-0-d043058fc4df@analog.com>

On Mon, Jan 12, 2026 at 04:55:53PM +0800, Edelweise Escala wrote:
> The LTC3220/LTC3220-1 is a multi-display LED driver, which contains a
> high-efficiency, low-noise charge pump to provide power to up to
> 18 LED current sources. The LEDs are individually configurable to
> 64-step linear brightness control, blinking and gradation control
> via 2-wire I2C interface. The blinking and gradation configuration
> is shared across all LED.
> 
> LTC3220 has a quick write function which allows changing the brightness
> on all LEDS simultaneously when the brightness is changed on led 1.
> For this we made quick write a device property which user can set on the 
> device tree. We would like to know if this approach is alright?
> Another way we might want to know is, is it alright to just make a
> virtual led for the quick write function. Changing brightness on 
> the virtual led will change the brightness for all.
> 
> V2 Changelog:
> leds-ltc3220.yaml changes
> -Fix wrapping on description
> -Improve description and commit messge to describe hardware
> -Drop ltc3220-1
> -Drop charge pump
> ltc3220.c changes
> -Fix wrapping
> -Drop ltc3220-1
> -Drop devname_mandatory 
> 
> Signed-off-by: Edelweise Escala <edelweise.escala@analog.com>
> ---
> Changes in v2:
> - EDITME: describe what is new in this series revision.
> - EDITME: use bulletpoints and terse descriptions.

Huh?

> - Link to v1: https://lore.kernel.org/r/20260106-ltc3220-driver-v1-0-73601d6f1649@analog.com

Best regards,
Krzysztof


