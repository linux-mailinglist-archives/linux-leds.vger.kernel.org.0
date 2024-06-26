Return-Path: <linux-leds+bounces-2125-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 98BBD91865D
	for <lists+linux-leds@lfdr.de>; Wed, 26 Jun 2024 17:56:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C926F1C221E7
	for <lists+linux-leds@lfdr.de>; Wed, 26 Jun 2024 15:56:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D0A118EFDA;
	Wed, 26 Jun 2024 15:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GaTK2JmJ"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03FAE18EFD4;
	Wed, 26 Jun 2024 15:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719417380; cv=none; b=MyNo/UXUTsy0snEIzNVTUKEzcWNCjRnFFYNhbjK6rhNgJoQd+yLM5cke8TVw8tCCdKkoK3eolcvQKw4NrYnj/b1EHV+TxwZROb7lYMFMwkkyDgb6NFAER4/LP/mBhMHopS0IecHHGEJ7/BaTjR60H+H4jPFFjrTXlaMNapd4OI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719417380; c=relaxed/simple;
	bh=DPWbAcDL/OQS1MY3Fx8fKQQcPAKUBRH+3zh4H/37qag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h6ul/L0N3NL3QyoNQbc6wWvVxGUnN2z4dbNI3IaGs/Jf/A0CTUrMcKyRiQnHX7vpU4pPcAVDHcEJbrmEahrMC5UFsCyfz/kaUT/Q23ZZFlY9LVw4AXtyroK8GpBYpLHO5AY+KEupCcV1gjfE14BVO7uZ76dkUyAiSPJagA+L1a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GaTK2JmJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81105C116B1;
	Wed, 26 Jun 2024 15:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719417379;
	bh=DPWbAcDL/OQS1MY3Fx8fKQQcPAKUBRH+3zh4H/37qag=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GaTK2JmJucUiILsNX5PF551QzxFjyLIOHKq4HpWPiFUdyBD29MneAQ9Tz3y3VICMy
	 APdOZH+WakvP3o/U/l9bdOOOJVPTqiSPuEUQsvb1yZ3Im6l1F9L6nibrFgwk1Vpj2H
	 ecTdsTcD++FImeYJzKWfJBCnrWD4m9PZ5ZiIFoYaVBiISCEme1HsHu5d6xhexplIhV
	 z1OhhWZ29g7ehnZBpAYmQHX6ZWaPxBTI/Wdg34ITkzq/Qhmn6wrhyIK+/DzWVX6wzs
	 Wk+zMG5sPlVPHYuIcFtM0rZq5EWFU7+t9+LSmUqlw8bOJVtLFcrNQBB35jK9GZfpkH
	 N9siRwdIeqhxw==
Date: Wed, 26 Jun 2024 16:56:15 +0100
From: Lee Jones <lee@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-kernel@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
	linux-leds@vger.kernel.org
Subject: Re: [PATCH 1/1] leds: core: Omit set_brightness error message for a
 LED supporting hw trigger only
Message-ID: <20240626155615.GF2504017@google.com>
References: <20240613075712.2479669-1-lee@kernel.org>
 <20240620090932.GD3029315@google.com>
 <778ec5c9-9ec2-4496-a458-b323d8904b0d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <778ec5c9-9ec2-4496-a458-b323d8904b0d@gmail.com>

On Mon, 24 Jun 2024, Heiner Kallweit wrote:

> On 20.06.2024 11:09, Lee Jones wrote:
> > On Thu, 13 Jun 2024, Lee Jones wrote:
> > 
> >> If both set_brightness functions return -ENOTSUPP, then the LED doesn't
> >> support setting a fixed brightness value, and the error message isn't
> >> helpful. This can be the case e.g. for LEDs supporting a specific hw
> >> trigger only.
> >>
> >> Pinched the subject line and commit message from Heiner:
> >> Link: https://lore.kernel.org/all/44177e37-9512-4044-8991-bb23b184bf37@gmail.com/
> >>
> >> Reworked the function to provide Heiner's required semantics whilst
> >> simultaneously increasing readability and flow.
> >>
> >> Cc: Pavel Machek <pavel@ucw.cz>
> >> Cc: linux-leds@vger.kernel.org
> >> Suggested-by: Heiner Kallweit <hkallweit1@gmail.com>
> > 
> > Heiner, you good with this solution?
> > 
> > A Tested-by or Reviewed-by would be good if you have the time.
> > 
> >> Signed-off-by: Lee Jones <lee@kernel.org>
> 
> Reviewed-by: Heiner Kallweit <hkallweit1@gmail.com>

Added, thank you.

-- 
Lee Jones [李琼斯]

