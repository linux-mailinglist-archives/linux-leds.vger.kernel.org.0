Return-Path: <linux-leds+bounces-6319-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id E675EC8A8F6
	for <lists+linux-leds@lfdr.de>; Wed, 26 Nov 2025 16:14:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C1F5F35820F
	for <lists+linux-leds@lfdr.de>; Wed, 26 Nov 2025 15:13:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0306E303A1B;
	Wed, 26 Nov 2025 15:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YiRXpqfV"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D295222A7E6
	for <linux-leds@vger.kernel.org>; Wed, 26 Nov 2025 15:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764169998; cv=none; b=l8fqHn5Eik48rSSpBKgxsVsDB99BY4sI+5dBVGJHdHLFFEKTYeMWcyufXyxsKtZOwAubpoAfI7hWDKMhAtW3uPJvo7W65aJjjU0ZbdalYkthA111qv0IndNiPq1ULeG5kFOJl0wy0Ba+AzOHrwGJ9ohLazHMuDEqvuMG7TwgrDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764169998; c=relaxed/simple;
	bh=fEkmddd7EiHDKABFoOk8xqa2crD7MaN4iatVeyEvDuo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K7yKJMO3AHczkpvlaec/bxJWw4OlbIEgXw0in3maIINICpbFW91FAQl2JfNpcREUf9NJwujqo2WcFSzyAvXhS8O8kgKBpoHBrNAAxs6xogF67D3yvHKl4huGZD3ksjkrbhdOyPqohcXsLR471fbOJdffbGwp4uvACK6AN5OHn+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YiRXpqfV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3526C4CEF8;
	Wed, 26 Nov 2025 15:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764169998;
	bh=fEkmddd7EiHDKABFoOk8xqa2crD7MaN4iatVeyEvDuo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YiRXpqfVJ6rjhwxvcCnOJAJAuKxCVZ316fTCUE8+bX6VODg5hrYpJErKAt/UQt4C+
	 9oTlPURWC6fF2FpBwsAcH5csY2AI3mjigp7d6yCg/SBRYNQCfWU0gnv5AJNfqumGvz
	 O9C6v2kv3GG+YQgADDJQO/Sr3E/urwP98qZTqERtvBu7mkSWUEDvzpEBC7C7TZ16gc
	 CxvjoYGInwz1ZvGeU4XHXGZiEfdm81gzrknonGN3ctCJmTpXLP/oi9A//T5Z2Z8pp8
	 PWE1IjEooAWs7E589cJQaeU5vvJhmnVfVmuxGPZoUqL58NCKN/Y/RfqMu12tHJQ6FV
	 9DJLP45hYtp3w==
Date: Wed, 26 Nov 2025 15:13:14 +0000
From: Lee Jones <lee@kernel.org>
To: Daniel Mack <daniel.mack@holoplot.com>
Cc: linux-leds@vger.kernel.org
Subject: Re: [PATCH v3 0/3] leds: is31f132xx: add support for is31fl3293
Message-ID: <20251126151314.GF3070764@google.com>
References: <20251121113557.77418-1-daniel.mack@holoplot.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251121113557.77418-1-daniel.mack@holoplot.com>

On Fri, 21 Nov 2025, Daniel Mack wrote:

> This is v3 of the series to support the is31fl3293 with the is31f132xx
> driver.
> 
> Daniel Mack (3):
>   dt-bindings: leds: add issi,is31fl3293 to leds-is31fl32xx
>   leds: is31f132xx: re-order code to remove forward declarations
>   leds: is31f132xx: add support for is31fl3293
> 
>  .../bindings/leds/leds-is31fl32xx.txt         |   1 +
>  drivers/leds/leds-is31fl32xx.c                | 234 +++++++++++++-----
>  2 files changed, 177 insertions(+), 58 deletions(-)

This set does not apply.  Please rebase onto -next.

Since you have to rebase anyway, please see the nit I have in one of the patches.

-- 
Lee Jones [李琼斯]

