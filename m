Return-Path: <linux-leds+bounces-1915-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68036907985
	for <lists+linux-leds@lfdr.de>; Thu, 13 Jun 2024 19:15:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5B81D1C21E3C
	for <lists+linux-leds@lfdr.de>; Thu, 13 Jun 2024 17:15:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4355E1304BF;
	Thu, 13 Jun 2024 17:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U5FEFsN2"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF0712EBE9;
	Thu, 13 Jun 2024 17:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718298953; cv=none; b=Srm8+DolDPdyz3wUUk73KHWfiRZUV1Hm+Z1swksaGBljQYp1hy7EplKpMXDtirwfDSnTBwGsICX/qxrq3welVVqwEAs/p4IZe33q4v/sFOp0MiczbF1yCCMG5uIBRDt2Z+Vy79YKBM2+MgUmDr72kR+a9UtSo60oqAHoYZcFgoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718298953; c=relaxed/simple;
	bh=AKgUZWTneAiK4fPUdfiAf7GhaKqL6NLz/YozloQMn/Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ASWcjQMDTIQSpAyrFMpOZmfA+TpQ86IE4K2gNSFfaLMmiXtRiObQndITA9KarDcO9XsHi14Hj3OoNVJ2O32x1172UGP8R0iHxMdv8MdVm3y35eDgYR9Na8/feeNpKSUTI48CoMQy5TSjdLVVN8T+IJB8jyd8f+B3Dj/Tw7vku2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U5FEFsN2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 551FFC2BBFC;
	Thu, 13 Jun 2024 17:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718298952;
	bh=AKgUZWTneAiK4fPUdfiAf7GhaKqL6NLz/YozloQMn/Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=U5FEFsN2KrLkAoR7D3TVrsdjdzmMZzPryoAbN6bET5++qg4qy2YPfYW9hSKAByqro
	 kHHBVyr2eg1b+S/XRFbvwpPDTQPAFhZTmHz/nmMOZj6NX+s2U5wQ5S90DlpW67Bun0
	 i5x2O9KGlaRqE6W+JZwOY7I/EPWijn4mftJrdCdTWmJC2vMMHMTNvayMJo2KNxH/1c
	 2+Ulxr+i3ftXyifqGCsSnHhHw4+trlHVUXs2ZHcRRuCscs2O1fBlHjrbMQ4veMS0I7
	 h409+7g3bd5k6D7NzdBqEvI8lMc7nRlOmK/XbrkgVioTLgOoLujFtv67FLAyTm3A4h
	 b0epjAtf5rIHw==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, Julia Lawall <julia.lawall@inria.fr>, 
 Marilene A Garcia <marilene.agarcia@gmail.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, 
 linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240611001740.10490-1-marilene.agarcia@gmail.com>
References: <20240611001740.10490-1-marilene.agarcia@gmail.com>
Subject: Re: (subset) [PATCH linux-next] leds: tlc591xx: Replace
 of_node_put to __free
Message-Id: <171829895106.2728913.15291317258101925669.b4-ty@kernel.org>
Date: Thu, 13 Jun 2024 18:15:51 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Mon, 10 Jun 2024 21:17:40 -0300, Marilene A Garcia wrote:
> Use __free() for device_node values, and thus drop calls to
> of_node_put().
> 
> The variable attribute __free() adds a scope based cleanup to
> the device node. The goal is to reduce memory management issues
> in the kernel code.
> 
> [...]

Applied, thanks!

[1/1] leds: tlc591xx: Replace of_node_put to __free
      commit: 5e6bc823b5c152b2a7854c61ec2054b0223ad2dd

--
Lee Jones [李琼斯]


