Return-Path: <linux-leds+bounces-4272-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF12A60F9E
	for <lists+linux-leds@lfdr.de>; Fri, 14 Mar 2025 12:09:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 783B7189999F
	for <lists+linux-leds@lfdr.de>; Fri, 14 Mar 2025 11:09:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F3B51A5B82;
	Fri, 14 Mar 2025 11:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SSe58QMc"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF641F3B87
	for <linux-leds@vger.kernel.org>; Fri, 14 Mar 2025 11:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741950573; cv=none; b=juov5z8tOJ7xOXZHR4hfYOZrP2HavhZsJ/6c45Rz+hBZSxKTKmJ9fTmuGLR2KdJyqztIIG0p7TAskI9tjnAIbKT4WFTt7jhYJOLKA7q8OLBw32p25VdTijXO48I7EuHvd8YbBILYzFeaivSD8DaKFnq4+rgoajO1Wyocwnj+U9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741950573; c=relaxed/simple;
	bh=7DVJ9hlL2N6ry1BU3q7mn37eu068nYK1cmNSbyFQFMo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C8iJxudPXjAFCGHMoy0KT5/CVW229LwA4xB7cy9SW/jVyhWQtAlq7tM5pJu5TfOHAs/6riupmC69s6/RsXcXQiTloOxU+rUSLq86gnwyvI2l74PPyjmoAU1nItKRpX3RBqus1P3X89Y644eYu0RRfBWmt0qj0YBbE3GlWSYMQQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SSe58QMc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3DB5C4CEE3;
	Fri, 14 Mar 2025 11:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741950571;
	bh=7DVJ9hlL2N6ry1BU3q7mn37eu068nYK1cmNSbyFQFMo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SSe58QMcGEExrx2Z7U1PAmLWFWFz1UOd1Jd8bXtk4vBwBcMpSgKDtiIWZrJS77+k0
	 HSn3P5TbuxBkR2Oas6Fgl51Nez8t8yhSdvBlyQ1sGyUmjuvwoYLfh746CHL31sZiWY
	 cQNK41PJ3lJHMIZhIJeA5WTD3XfuLOU8CUXhQcWlkV1lo0+2dlDqbTeFkBZRuY9bN9
	 RLYVXJBgeMdUQCl5Byq5kJRGtWQPvIFjjTSAVztOtxv78NXeWVaMhf40thgq1R0lQW
	 LqJhKpDpJoT4rTtxD/BUdd/DqhS45+8R779HHa/Q24VrrLypMMfwmQ9VqUOL4KWnsp
	 COeudbbzLb4Uw==
Date: Fri, 14 Mar 2025 11:09:28 +0000
From: Lee Jones <lee@kernel.org>
To: Craig McQueen <craig@mcqueen.au>
Cc: linux-leds@vger.kernel.org
Subject: Re: [PATCH] leds: uleds documentation fixes
Message-ID: <20250314110928.GG3890718@google.com>
References: <20250311042642.373782-1-craig@mcqueen.au>
 <20250314110853.GF3890718@google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250314110853.GF3890718@google.com>

On Fri, 14 Mar 2025, Lee Jones wrote:

> On Tue, 11 Mar 2025, Craig McQueen wrote:
> 
> > * Add max_brightness field to struct for setup.
> > * Reads are a signed int value, not a single unsigned byte value.
> 
> SoB
> 
> You must remember to use `-s` when committing patches.

And run checkpatch.pl and Cc: LKML.

-- 
Lee Jones [李琼斯]

