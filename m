Return-Path: <linux-leds+bounces-6583-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0114DD03FE8
	for <lists+linux-leds@lfdr.de>; Thu, 08 Jan 2026 16:46:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 000293089E31
	for <lists+linux-leds@lfdr.de>; Thu,  8 Jan 2026 15:27:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38D08497B19;
	Thu,  8 Jan 2026 12:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ULBBF+Rk"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43A6497B01;
	Thu,  8 Jan 2026 12:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767873834; cv=none; b=XUUcZo0FaYmhPDOXJ2gtY+SmA+55Si1RWN0GLOv5CJ+k4fHtr4K4yt470mWIxqWMyCO0wOsmzkRpGHy3umoWP43/l2D33aqxFTw1PS2rF+PHNXqifPCvncNYJwCK88ofxCknZcNdrDtHpty3ieGL0hTvmhL2ArC8iQtpnnTMRo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767873834; c=relaxed/simple;
	bh=u2r8N2OwYkdIs2X7oZS9cb7zrnE1BVN4o5d8/Elza4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yv3al0ZPs9EGg5CC+OSSVg3or0jqQ/eaxKA1RxLh83b0Ry0Q/kc+uPeb1NBplvnESytVZbCDLOP/B2TDsemuXd8P2z6Q5hQbkhRrmLZY8OWg2Zz5gI51YeQANxXFknaZrtXHXN/XhMCBt8qSj5Hcf4/jtGvJRM4j3lZYxzbo6SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ULBBF+Rk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 753E7C116C6;
	Thu,  8 Jan 2026 12:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767873833;
	bh=u2r8N2OwYkdIs2X7oZS9cb7zrnE1BVN4o5d8/Elza4Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ULBBF+RkZQ0BZFIH2YGVK6wKvx+jVayuzZ04LMX7wPwpmwR9wI73OA/ybp5F1Vq2S
	 0JAnpBBW+wiJx5sYOSKqIUz+a/6Hj+m6MF1n+9fjw3knG2VPZXRpg6MJQu6wS1VI2F
	 2iQRl0s/pCnTT7zZdhuMJG11iQ8jFFWiRu983AGq9/CWp5E/TCScaIJDKl6617JGjk
	 /9YNeINNIVDbMVMEo31RjsklPVzZYWY2e1Q7qUG84kAIwcquKhXC0inwwhHV56frrX
	 +3hEPet9F4Q9GWoxCAfLWVYqt6zn/oClS+MzQ9NWpKIKf39LW11S5Fb+o2OepglH7H
	 GwxTJvX/nJPXA==
Date: Thu, 8 Jan 2026 12:03:48 +0000
From: Lee Jones <lee@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Tiffany Yang <ynaffit@google.com>, stable@vger.kernel.org,
	pchelkin@ispras.ru, linux-kernel@vger.kernel.org,
	kernel-team@android.com, Pavel Machek <pavel@ucw.cz>,
	linux-leds@vger.kernel.org
Subject: Re: [PATCH 5.10,5.15,6.1,6.6 RESEND] leds: spi-byte: Initialize
 device node before access
Message-ID: <20260108120348.GH302752@google.com>
References: <20251231004510.1732543-2-ynaffit@google.com>
 <aVe7_7Jf_FWkBhqH@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aVe7_7Jf_FWkBhqH@smile.fi.intel.com>

On Fri, 02 Jan 2026, Andy Shevchenko wrote:

> On Tue, Dec 30, 2025 at 04:45:11PM -0800, Tiffany Yang wrote:
> > Commit 7f9ab862e05c ("leds: spi-byte: Call of_node_put() on error path")
> > was merged in 6.11 and then backported to stable trees through 5.10. It
> > relocates the line that initializes the variable 'child' to a later
> > point in spi_byte_probe().
> > 
> > Versions < 6.9 do not have commit ccc35ff2fd29 ("leds: spi-byte: Use
> > devm_led_classdev_register_ext()"), which removes a line that reads a
> > property from 'child' before its new initialization point. Consequently,
> > spi_byte_probe() reads from an uninitialized device node in stable
> > kernels 6.6-5.10.
> 
> I'm wondering if in long term the easier maintenance will be with that patch
> also being backported rather than this being applied.

Works for me.

-- 
Lee Jones [李琼斯]

