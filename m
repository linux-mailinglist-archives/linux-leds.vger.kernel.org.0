Return-Path: <linux-leds+bounces-4183-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AF447A55AEB
	for <lists+linux-leds@lfdr.de>; Fri,  7 Mar 2025 00:32:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1455A188D702
	for <lists+linux-leds@lfdr.de>; Thu,  6 Mar 2025 23:32:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F254026BD82;
	Thu,  6 Mar 2025 23:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FEP7kox7"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD78A13D897
	for <linux-leds@vger.kernel.org>; Thu,  6 Mar 2025 23:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741303954; cv=none; b=jyCd+8be8PdyI11w8+wnznnyUNqh0acHojQkVfERX+nZyMzibEcp6UTzdu/6r4YnawnrAOsMMz7klUGOwR008/VCQkQlcpmCFtQvOSgYfMQO1GOrh6QMT/mHaNREr+2jmUNqvHbNemKvc4PgHRtgR8SHhbN/hN0WpSJl2sN1x84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741303954; c=relaxed/simple;
	bh=Sm0ZUtQMFACoyQFIhMh8XKNzC4/Yf8cthwNjgsAj6TE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nLw31LyBSGcBo/A4eonsyk4iS7ZIRwgbHS79o71/UMlcWqaBp7Vf6cNovl0SSGCsBDXylwE4QaJtvRnShZHp6kR3SAocqvxqFUXwQXEb5kWdkKqQuaipMX6gtwp4FfrU+8AVyRKLaSpmY7rRLIzpbJgVC7tOmc/eAhJ2TpYsF94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FEP7kox7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 287C6C4CEE0;
	Thu,  6 Mar 2025 23:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741303954;
	bh=Sm0ZUtQMFACoyQFIhMh8XKNzC4/Yf8cthwNjgsAj6TE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FEP7kox7YO2oP32bGeJPjWfqCTXeMEJYy/9bIB9gZ8qgWAqinFse6y4sYwIM2641k
	 JabtbethnJ8SG5T3wiqSw94d/n51/ePs7WFisanWpHExuxPv+NOUuCTLyLYxxlFeyA
	 So438RV3bPsteTt9xlyaBiiBOxcat7pz37ocWVByRbYOjQIZsaJwkE81iFZCP86vbv
	 XWNw4JBaBU3dazVJwKcmjfrGKJaQb/xf0GHtXdQjC+37O6YiKOw+MCH1tcv80ZNELs
	 2byPb57/QBE2ZkzEz0rtQWlpmr3fz5zjOVBXEm6TkoSn2ShtZfqE3j96qtYmvj3+pM
	 jsHdfE0Bi4Ksg==
Date: Thu, 6 Mar 2025 15:32:32 -0800
From: Lee Jones <lee@kernel.org>
To: Craig McQueen <craig@mcqueen.au>
Cc: linux-leds@vger.kernel.org
Subject: Re: [PATCH] led-triggers: accept "default" written to sysfs trigger
 attr
Message-ID: <20250306233232.GC8350@google.com>
References: <20250306225524.318562-1-craig@mcqueen.au>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250306225524.318562-1-craig@mcqueen.au>

On Fri, 07 Mar 2025, Craig McQueen wrote:

> If the text "default" is written to the LED's sysfs 'trigger' attr, then
> call led_trigger_set_default() to set the LED to its default trigger.

More info please.

Please explain why this is useful.

Under what circumstances would the default trigger not be set?

> ---
>  drivers/leds/led-triggers.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
> index b2d40f87a5ff..f2bc3bb5062d 100644
> --- a/drivers/leds/led-triggers.c
> +++ b/drivers/leds/led-triggers.c
> @@ -54,6 +54,11 @@ ssize_t led_trigger_write(struct file *filp, struct kobject *kobj,
>  		goto unlock;
>  	}
>  
> +	if (sysfs_streq(buf, "default")) {
> +		led_trigger_set_default(led_cdev);
> +		goto unlock;
> +	}
> +
>  	down_read(&triggers_list_lock);
>  	list_for_each_entry(trig, &trigger_list, next_trig) {
>  		if (sysfs_streq(buf, trig->name) && trigger_relevant(led_cdev, trig)) {
> -- 
> 2.48.1
> 
> 

-- 
Lee Jones [李琼斯]

