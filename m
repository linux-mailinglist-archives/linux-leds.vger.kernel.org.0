Return-Path: <linux-leds+bounces-4799-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7EAAD8FA4
	for <lists+linux-leds@lfdr.de>; Fri, 13 Jun 2025 16:36:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 809561891868
	for <lists+linux-leds@lfdr.de>; Fri, 13 Jun 2025 14:36:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99F4319047A;
	Fri, 13 Jun 2025 14:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="USDM4MbY"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD871CFBC;
	Fri, 13 Jun 2025 14:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749825359; cv=none; b=VYINeVGc1DKeZnZehop5oORUIWo2/PpQcrzAv+B2zk+yTebR9twPtjNQ3s5rKqN+2Pz9h6VzgiKk16NT4c9X1GdWNHJdSm+n3vBEr81q8fi59jCGonYZtNOTxBuHbCZ7naPkOOd0nDevCOZvrN3jbqxAyXd3frZMOQ3rzjWeBVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749825359; c=relaxed/simple;
	bh=u9idUxV2zmQa9sIXvRNYlgPFzi8ArR1OUQCb35Bkex8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T1L3a5Mjca46wrhlXaxeE9hg5bVmmzE+VHk69qdZ+cbXnz1TQ1BWskz3SK2XWQwKrGAxyerTY1i8Pjy0RL5FXF161iGtxpvGaQSI7XVoyXfKF9x93JwbykvR+5SbNABnZRUySAv8dXQZP3/Sq+fT1nFnvecs4pCdlhuVWL3Cx9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=USDM4MbY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75325C4CEE3;
	Fri, 13 Jun 2025 14:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749825359;
	bh=u9idUxV2zmQa9sIXvRNYlgPFzi8ArR1OUQCb35Bkex8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=USDM4MbYr9cIjo4r5hforAVQm7boY+23nNng1U+u6+mzjc+BOhuPe0w5B1giAmL4J
	 M4Iyd7aM2UAMPuMLxqiSaE2JQtfTxgJbNfzgCsY3AtHC42Wm40qtS+tSAWkOctdwFU
	 QVazYkY/jm7y2Y4T8yn5hz/FCsC0TI8ZD3QYzujyOjlyO+Edb9H0FBkVL7lZuCkSl1
	 cJP1VO/Lt09nY9nV3RzQECGZIo38UmpqpFLwzUxi77T+B3RMXKH9MVbh9wsrh9vg0P
	 iI6f2XFHhRTassNoB0heYbeKdB8uIb/GjW5jN2yYT+fdztKcOZ71UehN70wTJTCYEG
	 ytjgLK8aFrDxQ==
Date: Fri, 13 Jun 2025 15:35:54 +0100
From: Lee Jones <lee@kernel.org>
To: Matthias Fend <matthias.fend@emfend.at>,
	Pavel Machek <pavel@kernel.org>, linux-leds@vger.kernel.org,
	Lukas Bulwahn <lbulwahn@redhat.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: Re: (subset) [PATCH] MAINTAINERS: adjust file entry in TPS6131X
 FLASH LED DRIVER
Message-ID: <20250613143554.GK897353@google.com>
References: <20250527065434.202622-1-lukas.bulwahn@redhat.com>
 <174982475603.946253.15625144456457817574.b4-ty@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <174982475603.946253.15625144456457817574.b4-ty@kernel.org>

On Fri, 13 Jun 2025, Lee Jones wrote:

> On Tue, 27 May 2025 08:54:34 +0200, Lukas Bulwahn wrote:
> > Commit 0d12bb1a7fb6 ("dt-bindings: leds: Add Texas Instruments TPS6131x
> > flash LED driver") adds the device-tree binding file ti,tps61310.yaml,
> > whereas the commit b338a2ae9b31 ("leds: tps6131x: Add support for Texas
> > Instruments TPS6131X flash LED driver") from the same patch series adds the
> > section TEXAS INSTRUMENTS TPS6131X FLASH LED DRIVER in MAINTAINERS,
> > referring to the file ti,tps6131x.yaml. Note the subtle difference between
> > the two file names. Hence, ./scripts/get_maintainer.pl --self-test=patterns
> > complains about a broken reference.
> > 
> > [...]
> 
> Applied, thanks!
> 
> [1/1] MAINTAINERS: adjust file entry in TPS6131X FLASH LED DRIVER
>       commit: 3bc1740d3157c9a9d30614371400f490dbbffd62

I added the missing Fixes: tag for you.

-- 
Lee Jones [李琼斯]

