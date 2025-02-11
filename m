Return-Path: <linux-leds+bounces-3932-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C5DA3108B
	for <lists+linux-leds@lfdr.de>; Tue, 11 Feb 2025 17:02:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 458F5169413
	for <lists+linux-leds@lfdr.de>; Tue, 11 Feb 2025 16:01:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8062B2512E3;
	Tue, 11 Feb 2025 16:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="esBJr3DX"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C781FAC54;
	Tue, 11 Feb 2025 16:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739289689; cv=none; b=VWvVlVG4BaLjXDyTmvnXpLRJTeAvbHwitAHtcAneB5MG5X4o6kja0RHqz4FHGz3uDSJM46LseA78aqdrlyQGzfhNK4q7bzhO4AVoyp0yxggGYaOIj7TnzramQsnm98yHqZCF+pWAD6D/t1a2TxYwmaSM8afHY8Pew0Rmd7GeSSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739289689; c=relaxed/simple;
	bh=UYdvmqtytnv6ah30A3zusDykpYbs89NIsfy+rlZGEGo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CP+J856zGvUKUj/Jfn4r0cXvUspI89LjWL9Th4wWIXMctoHOAtPtDgRbqCJtrsbF12ngVzIuvz4318HTPR1IoA2oWu8uOcnY2y3NJYo3v6rnawy4GzWaYADQghZAEUBk2u+XOJCY4DTl8KOMlsoZwHpwuuPIT4lhl3VkV1xxUzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=esBJr3DX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3D98C4CEDD;
	Tue, 11 Feb 2025 16:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739289688;
	bh=UYdvmqtytnv6ah30A3zusDykpYbs89NIsfy+rlZGEGo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=esBJr3DXyA2rbuHfl2U/KS2hah9B4L8hXvizoHEMIQoTgXgt6hER2BnL9kxw6CKqS
	 KBVa/OqBpzkKqcOQv1lih5Qugq/q6FN1mAJ1rD7yR9na3PVtHI/wWobEChbEeXemFp
	 HsIJRBegCba1gurTOF74vOQZOSbGh0/r+cJO6DIc78JCati3GV7LhC/Cvh77gWMoon
	 EKMUXa1psUD/9ZCCW8Q1mCZhT5YTEs8sEB40ZN61jUA2GNSEXP34oL6DW94qi8wbiX
	 dsCBHDC5IffMgmCd3BTYwQSP7BQC04/z3unrjiqqCT0MqP8Z9gh0TWwrdORR6LwVt7
	 o4WSN/tXojFoQ==
Date: Tue, 11 Feb 2025 16:01:25 +0000
From: Lee Jones <lee@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Pavel Machek <pavel@ucw.cz>, kernel list <linux-kernel@vger.kernel.org>,
	rafael@kernel.org, linux-leds@vger.kernel.org
Subject: Re: MAINTAINERS: Move Pavel to kernel.org address
Message-ID: <20250211160125.GA2274105@google.com>
References: <Z6Ow+T/uSv128wdR@duo.ucw.cz>
 <20250211141109.GV1868108@google.com>
 <CAHk-=whdcXj==9TkCpQYpmzLweCoDzd9_i8SrODjaQ3ysSe6dw@mail.gmail.com>
 <20250211155614.GY1868108@google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250211155614.GY1868108@google.com>

On Tue, 11 Feb 2025, Lee Jones wrote:

> On Tue, 11 Feb 2025, Linus Torvalds wrote:
> 
> > On Tue, 11 Feb 2025 at 06:11, Lee Jones <lee@kernel.org> wrote:
> > >
> > > I'm struggling to apply this.
> > 
> > Well, it turns out I already applied it as commit 511121a48bbd
> > ("MAINTAINERS: Move Pavel to kernel.org address"), so no worries.
> 
> Thanks.
> 
> Out of interest, how did you apply it?  b4 was playing up for me.

  Fetching patch(es)
  /home/lee/bin/apply-patch.sh: line 134: /tmp/<Z6Ow+T/uSv128wdR@duo.ucw.cz>.mbox: No such file or directory

Where apply-patch.sh: line 134:

  b4 am -3 -slt ${PATCHES} -o - ${id} > ${MBOX}

My first guess would be the stray '/' in the Message-ID.

-- 
Lee Jones [李琼斯]

