Return-Path: <linux-leds+bounces-1732-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C115B8D5FE9
	for <lists+linux-leds@lfdr.de>; Fri, 31 May 2024 12:46:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F1CD41C20349
	for <lists+linux-leds@lfdr.de>; Fri, 31 May 2024 10:46:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7B9B15625A;
	Fri, 31 May 2024 10:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gi3azm0/"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8488F15624D
	for <linux-leds@vger.kernel.org>; Fri, 31 May 2024 10:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717152395; cv=none; b=YBFii+xCLRE8qMr8+RCd30yt4FmIobFkhjBhX+8vuJ6sdfn07IHX7n+QcXL/0Z96OCe4Aj1eDLUT2rJs/9/G3BLTb1AR1MYeED86Hj/12CFQq3fr4UDV7nGhtZDQ9jRwgfqnzJOKyemPKyhtcYukgmm+CR+o1v+qQCcQmviQ8Tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717152395; c=relaxed/simple;
	bh=u7XPzgwstgP0Go+cevzExQcxxKv8alkjB23NPqLdc+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O9dWiCXqIo67kJBeVy06Q4m1t6LSVM5BsqBm3g6Mj8OnuQ+lXLq71K4/vevS0G/RrSgM7LBv7IU4GPoeMkeKCVdhqusSqb/+fXPfjpe+4sZH4GU6Kmc5BDh6ksDWGZ3/EuDU6xNbN1RSSthpGQV6qi3Dy5rBsXckOaLVdeuaBLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gi3azm0/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB4AAC116B1;
	Fri, 31 May 2024 10:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717152395;
	bh=u7XPzgwstgP0Go+cevzExQcxxKv8alkjB23NPqLdc+k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gi3azm0/4JqoT8r7bhKV8kwo2frES72evr7asusHIHnJmAA0R/WqAh8BUf1rR9Q1Q
	 w4rATIOacEpsl3/2Qn5KnpH1l+9+DY+fl3NnlOtsRSatriq+1NywcdruIng81qOFZt
	 dYFYvCfiNBs2Tf4x59fADe7+8rKPwaKfVQf3a426wzcUwbHZf7SAduMyazSUVkzwPE
	 9lx2FaYBGy8H5v26D25XldjFLmg3Ryzgah3oTKKgg/pdAC8U6RO7UGtnhyNMRFynK2
	 PxSrXkLIGfQ/d0YkfLwZcQ65kJ/waVy27zuF5gq1aSoFCyLq+nFI8xjsx7rAVr9+hh
	 dsDaqOVXHpp4Q==
Date: Fri, 31 May 2024 11:46:31 +0100
From: Lee Jones <lee@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Pavel Machek <pavel@ucw.cz>, Kate Hsuan <hpa@redhat.com>,
	linux-leds@vger.kernel.org
Subject: Re: [PATCH] leds: trigger: Call synchronize_rcu() before calling
 trig->activate()
Message-ID: <20240531104631.GD1005600@google.com>
References: <20240507095111.27109-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240507095111.27109-1-hdegoede@redhat.com>

On Tue, 07 May 2024, Hans de Goede wrote:

> Some triggers call led_trigger_event() from their activate() callback
> to initialize the brightness of the LED for which the trigger is being
> activated.
> 
> In order for the LEDs initial state to be set correctly this requires that
> the led_trigger_event() call uses the new version of trigger->led_cdevs,
> which has the new LED.
> 
> AFAICT led_trigger_event() will always use the new version when it is
> running on the same CPU as where the list_add_tail_rcu() call was made,
> which is why the missing synchronize_rcu() has not lead to bug reports.
> But if activate() is pre-empted, sleeps or uses a worker then
> the led_trigger_event() call may run on another CPU which may still use
> the old trigger->led_cdevs list.
> 
> Add a synchronize_rcu() call to ensure that any led_trigger_event() calls
> done from activate() always use the new list.
> 
> Triggers using led_trigger_event() from their activate() callback are:
> net/bluetooth/leds.c, net/rfkill/core.c and drivers/tty/vt/keyboard.c.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/leds/led-triggers.c | 7 +++++++
>  1 file changed, 7 insertions(+)

Looks like there have been a few changes to led_trigger_set() since this
was authored.  Please rebase and resubmit.  Thanks.

-- 
Lee Jones [李琼斯]

