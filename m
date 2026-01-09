Return-Path: <linux-leds+bounces-6602-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 88EE3D0AE8F
	for <lists+linux-leds@lfdr.de>; Fri, 09 Jan 2026 16:30:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C3558303AC18
	for <lists+linux-leds@lfdr.de>; Fri,  9 Jan 2026 15:26:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2F9A3659F3;
	Fri,  9 Jan 2026 15:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UHAoUyag"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A01D363C5B;
	Fri,  9 Jan 2026 15:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767972358; cv=none; b=mj1s1SzuGCKPune0jXL9LZrVmHj+WdsdEnaCWrqIxSP9XnJzSAagLq+ioQB3yb9mFp8gleFZDpfTdWrk9A8Emca3XnuUoFH827dRLFJo4ASjo4AAJ6fzExgvr3yeutHI6R1TiVToqKBwDTR8ZGX+s68aX0/spSOJ4sfjDOm8gas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767972358; c=relaxed/simple;
	bh=ETVDi4C2VPF56orH4nnLdMX/d9G/fVSaL94Yn3MavyU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ruzDguQcMQFjWLIFQJkti+1PlZy9rKbcK7oUlrxQ5B+1beTKXHxgnep4/Gabh52+uyDccOHOKr/IXW6M+3CoFaCFp1q8eYR+jrrgfM5QYSx0zCu5Iy+dcvjmfD34jW9TKVehCa52NlqvQLh48Y7fTAWUEyX+vZaPeLvlpVsG6iU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UHAoUyag; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3009EC19422;
	Fri,  9 Jan 2026 15:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767972358;
	bh=ETVDi4C2VPF56orH4nnLdMX/d9G/fVSaL94Yn3MavyU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UHAoUyag87Xuam7FlMedWGEQ/wHpeUSYfChh6A5N0l2pup7BlH48Iwqh7Q7mJ6/xr
	 WE0JORpbOsl6PyLLAKkPcvMqi9grnsPsJARsCaw3HeFbNo8SBuH2P546vf3OrUD035
	 LxuyLjhuh5Js6ALzN+xlb6YjFFc7oQU+2UTQEnNeofMXGg8LGKyqjdricObro3yEXF
	 YPqNIAL3ECIm1Rp7Jt4Tn4St+Mk0bpefvxAhBcLPxqK/AVpUXXZ9W8ATUIKoxDDqxs
	 r0mcNw0As/uZT24lp6Cp/fujNtIRNhVR80OdFCQizZU6K+bx5/A9OUdvCCmBgGkcdf
	 Rs0LXC9tPWgrA==
Date: Fri, 9 Jan 2026 15:25:52 +0000
From: Lee Jones <lee@kernel.org>
To: Nam Tran <trannamatk@gmail.com>
Cc: pavel@kernel.org, gregkh@linuxfoundation.org, rdunlap@infradead.org,
	christophe.jaillet@wanadoo.fr, krzk+dt@kernel.org, robh@kernel.org,
	conor+dt@kernel.org, corbet@lwn.net, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v20 0/3] leds: add new LED driver for TI LP5812
Message-ID: <20260109152552.GJ1118061@google.com>
References: <20251221041950.4631-1-trannamatk@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251221041950.4631-1-trannamatk@gmail.com>

On Sun, 21 Dec 2025, Nam Tran wrote:

> This patch series adds initial support for the TI LP5812,
> a 4x3 matrix RGB LED driver with autonomous engine control.
> This version provides a minimal, clean implementation focused
> on core functionality only. The goal is to upstream a solid
> foundation, with the expectation that additional features can
> be added incrementally in future patches.
> 
> The driver integrates with the LED multicolor framework and
> supports a set of basic sysfs interfaces for LED control and
> chip management.
> 
> Signed-off-by: Nam Tran <trannamatk@gmail.com>

I'm ready to take this set now, but it does not apply.

Please rebase onto Linux Next or for-leds-next.

-- 
Lee Jones [李琼斯]

