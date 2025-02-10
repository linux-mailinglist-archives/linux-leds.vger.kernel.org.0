Return-Path: <linux-leds+bounces-3906-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7CEA2F461
	for <lists+linux-leds@lfdr.de>; Mon, 10 Feb 2025 17:57:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E95B3A33A4
	for <lists+linux-leds@lfdr.de>; Mon, 10 Feb 2025 16:56:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 133DB256C86;
	Mon, 10 Feb 2025 16:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e0pG3iPy"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA1D2256C61
	for <linux-leds@vger.kernel.org>; Mon, 10 Feb 2025 16:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739206623; cv=none; b=N+vHssKRRHRFZss/J2zxPG2C6Uv2Fu9AlImKbjQbcjXi4o66g/Emq51ABfLaf91A91NxGqeUzqnW8YJGIxnLzy1HeGxR6iF+YkYNE/M4+rFghEgOiJ+ka5SvS25ExJ9PzK/hbVGz8Q+hoKeQRvTOU4+f3lHeMIn8K0j16sUKV30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739206623; c=relaxed/simple;
	bh=Vkr4mTAqkfp0S8L8ubg3PEgpJKftfkbXhAdBrYY8C4o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=MoCnKi7WOucQLCX/AVaCPjP7Fwk+EPQ87FPxQiRHJQxKWtB59hJENEx9OSHSjlRul1oDlqnuBpOjHoX6/nsh5tPaiLa/rJPAdDAy7uZe7lXfPevzNv85oXGypK7WmYbtmD+hZBEDnvaWqo+cTHTgb0Nnnkyl2nTGcPbTn9JZvh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e0pG3iPy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC344C4CED1;
	Mon, 10 Feb 2025 16:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739206622;
	bh=Vkr4mTAqkfp0S8L8ubg3PEgpJKftfkbXhAdBrYY8C4o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=e0pG3iPyVAEJybcZLLKrDdPdU3PcbryMIm4HpWxCU8Xo7ekmUEwB36J/PsX/iN1ib
	 /wjxjJrCOyrWanhV/5SjFnrMJ2Z8T8qd7+eqt8vrm2hU10WCtefMwXarAf++PX6kdd
	 rbETKrgX/6sBQP4vSWgnqFAjhv+Vto1MK7oOAmNQw1drR1htH2NghVfi8q1LYZP6kg
	 ZBWPAiiHzsmShRajau6u8xSfsXpUmw1qJa4kYjVn3Jn6bmIQ9QQ10Wd9ntDgZ8x2wr
	 p1uNB8xntcpHp5Ug8LNoucrvcizpsoZ1gx91cO8n9JzmlRSShMrr1uxW079dsHirOl
	 TRqyLlfU/LCIQ==
From: Lee Jones <lee@kernel.org>
To: linux-leds@vger.kernel.org, Marek Vasut <marex@denx.de>
Cc: Andrew Lunn <andrew@lunn.ch>, Christian Marangi <ansuelsmth@gmail.com>, 
 Heiner Kallweit <hkallweit1@gmail.com>, Lee Jones <lee@kernel.org>, 
 Lukasz Majewski <lukma@denx.de>, Pavel Machek <pavel@ucw.cz>
In-Reply-To: <20250120113740.91807-1-marex@denx.de>
References: <20250120113740.91807-1-marex@denx.de>
Subject: Re: (subset) [PATCH] leds: trigger: netdev: Configure LED blink
 interval for HW offload
Message-Id: <173920662058.1906090.8995968896355513096.b4-ty@kernel.org>
Date: Mon, 10 Feb 2025 16:57:00 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Mon, 20 Jan 2025 12:36:53 +0100, Marek Vasut wrote:
> In case a PHY LED implements .blink_set callback to set LED blink
> interval, call it even if .hw_control is already set, as that LED
> blink interval likely controls the blink rate of that HW offloaded
> LED. For PHY LEDs, that can be their activity blinking interval.
> 
> The software blinking is not affected by this change.
> 
> [...]

Applied, thanks!

[1/1] leds: trigger: netdev: Configure LED blink interval for HW offload
      commit: c629c972b310af41e9e072febb6dae9a299edde6

--
Lee Jones [李琼斯]


