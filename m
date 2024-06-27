Return-Path: <linux-leds+bounces-2162-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BDAE91A00B
	for <lists+linux-leds@lfdr.de>; Thu, 27 Jun 2024 09:09:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 358A2B21EF6
	for <lists+linux-leds@lfdr.de>; Thu, 27 Jun 2024 07:09:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AA5D46B80;
	Thu, 27 Jun 2024 07:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TCBaqOp6"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0225D2B9B6;
	Thu, 27 Jun 2024 07:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719472154; cv=none; b=cDV7Vfrr1H/9dXe09tu0Gsvhv8BUkQAoez9IpAeUVf9g6gze2Ow3PXP+9V72t9pgAibFAQv3VfCfEd58baT8m/GrvBe013uzXVUlkeA+TKFO4UHocYQqcysvEQZe/WDWL38GvxySfQO6qsdJ5HGRo8dkN99Tsp5142btQC6jtVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719472154; c=relaxed/simple;
	bh=1eWL/GxKycmvkE734oDCV2N6p2/7jP7/DIurDMnOZ7A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aHzelsCMUc1dWjQ5hELnJuTPHYGjEdTkBX4Zk0ZdNhJKQM5dCreabBQC7o9a23DRvAsPZZiV922V8lvfns4muplTraIKgFKWCtKMw/EIpJHqTrf2RPy1sxTGUrw9u8MgvlrxqiG9d1KzOjNnKycr+05HmZMGK8shJ7ESJLXEGPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TCBaqOp6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58A5FC2BBFC;
	Thu, 27 Jun 2024 07:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719472153;
	bh=1eWL/GxKycmvkE734oDCV2N6p2/7jP7/DIurDMnOZ7A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TCBaqOp6iThied0HKUcX6wqQh0p/VXOxy18PPSTxKA/vZH7adE/lYLHt/pXBvyLx+
	 bVTlcXZOntYQbTXr1jKf2B+YYTlGKk5AndotExhPPv2SS4qIQH1ZBCn9aMGGhJ2pNo
	 QWAcC9+ZtnSopENszz1gsD4qEGbLtRcXr321kk/G5lq8Mxj5rfAYDnqNTjcSjx6ePN
	 KTcQWMjZQPOo5Xu5gIx4gAnAErMz5ZF+ZVV1d2K9k9102DdOwsbKJdmoNZMG6Oljd8
	 gNEh9IupyFCF84mbzlp5BL/3P8uSgOvDInClf2s1FbEwfY5kbBUAxEiXbmmhSH70K+
	 Vt/byK90szGbQ==
Date: Thu, 27 Jun 2024 08:09:09 +0100
From: Lee Jones <lee@kernel.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Christian Marangi <ansuelsmth@gmail.com>, linux-leds@vger.kernel.org,
	Pavel Machek <pavel@ucw.cz>, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/3] leds: leds-lp55xx: Convert mutex lock/unlock to
 guard API
Message-ID: <20240627070909.GD2532839@google.com>
References: <20240626221520.2846-1-ansuelsmth@gmail.com>
 <20240626221520.2846-3-ansuelsmth@gmail.com>
 <fa53fa80-4c0e-44d1-a62d-da219831526c@web.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fa53fa80-4c0e-44d1-a62d-da219831526c@web.de>

On Thu, 27 Jun 2024, Markus Elfring wrote:

> > Convert any entry of mutex lock/unlock to guard API and simplify code.
> 
> Thanks that you would like to support another bit of collateral evolution.
> 
> * Would you get into the mood to benefit any more from applications
>   of scope-based resource management?

Why don't you submit them yourself instead of asking others to do work?

-- 
Lee Jones [李琼斯]

