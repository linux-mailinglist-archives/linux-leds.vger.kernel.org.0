Return-Path: <linux-leds+bounces-3895-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F05A2BE68
	for <lists+linux-leds@lfdr.de>; Fri,  7 Feb 2025 09:51:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1E9837A54EF
	for <lists+linux-leds@lfdr.de>; Fri,  7 Feb 2025 08:50:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 580D31AE877;
	Fri,  7 Feb 2025 08:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lvFaH+Hq"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D85B1A4E70;
	Fri,  7 Feb 2025 08:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738918261; cv=none; b=r1qvxGqxiHegB8F42ubMIOqf294dAeuZChjz0PwGi1RShrF6+LbR+wJOqpq+qbf2RStaGvTlL7XBetJYjUtQA4sWjj7pDgmYre8lfPH5WoCP69i+QHEky89wV/xs2824QNg3mwY3LvlvyBqJjD5xajMOE73h/UdKs16qkvORCCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738918261; c=relaxed/simple;
	bh=T3W54SHWa96a65+LN6iONNhEHaWlCaDWZbQim5ZTSm8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mSxyTBI757U8xP/ThJeFtcDnlFuXKPornm3/NJ/x3f5+Yw/UowlE6NU7wMUSkFHeIe2hoZeP8N7d09s16xbes78oYOtImiPmm21p/6a6KRjm4VJ28uKXZIFzT1tO9MObLl4ECLlaWEALzz0xXL0sedEOpPU0iW8bZKFkzOvZeZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lvFaH+Hq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62ACCC4CED1;
	Fri,  7 Feb 2025 08:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738918260;
	bh=T3W54SHWa96a65+LN6iONNhEHaWlCaDWZbQim5ZTSm8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lvFaH+Hq6UCr+XLiUY+jb0PtNhitEgTYVXRwck47x92j5UPs5qd7aebiC6f7Bg8ML
	 xbNn20rriYRgFeRFlmcW4cJlqZCHxd4a+jgTs15UWIOsYgif/Vin0gCO96ljEZjHNe
	 +QdXuBgfB+ttrNzfiD7CS4yoKMGqaB808xkHZi1ba5mPm3n4ixYHnGjpaAoTi7Wswp
	 T3l2KYrrIjRNSN2WCF7NOX9KgpQ+UmrNOohrfSsNQ43dZF+bFIu8M3IsmVj7s8MkcK
	 6we99P05AWmMNvAHsc6F3x0cYv+KlEEor/AduxGSitKosmzYP9BCInaWsvbYykZqCF
	 NMDS4cJxBbZLg==
Date: Fri, 7 Feb 2025 08:50:56 +0000
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>
Cc: kernel list <linux-kernel@vger.kernel.org>, rafael@kernel.org,
	linux-leds@vger.kernel.org, torvalds@linux-foundation.org
Subject: Re: MAINTAINERS: Move Pavel to kernel.org address
Message-ID: <20250207085056.GD7593@google.com>
References: <Z6Ow+T/uSv128wdR@duo.ucw.cz>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z6Ow+T/uSv128wdR@duo.ucw.cz>

On Wed, 05 Feb 2025, Pavel Machek wrote:

> I need to filter my emails better, switch to pavel@kernel.org address
> to help with that.
>     
> Signed-off-by: Pavel Machek <pavel@ucw.cz>

LGTM.

Happy to merge this through LED after a few days of ML exposure.

-- 
Lee Jones [李琼斯]

