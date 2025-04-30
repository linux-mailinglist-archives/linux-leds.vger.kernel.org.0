Return-Path: <linux-leds+bounces-4564-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 444EEAA460B
	for <lists+linux-leds@lfdr.de>; Wed, 30 Apr 2025 10:56:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 15D431887512
	for <lists+linux-leds@lfdr.de>; Wed, 30 Apr 2025 08:56:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C96DF218EB9;
	Wed, 30 Apr 2025 08:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c9z1rL7c"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A28A21E4110;
	Wed, 30 Apr 2025 08:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746003394; cv=none; b=mGpA9V1oTMb7VP8CB3B1Vbmb+9tuC/iToEGVaPeTYua/QOAoT3mynH2ThS9JHKdUPqwiYsTuSOW37j90xMoAo2Z8NAmFicm6mCJOZmpProvgLNtFIhRzD+aP2IxSXUudYCgEtoHNm9FkmH6jCONn2aonay7TCuU6uXma6qR+sco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746003394; c=relaxed/simple;
	bh=t0sNMjfpZFZ/tkTiw1mOgfiMQQ17CSRGsWtVuNG7b3M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=quHky3MPSp1AKqwIrQhJkv3iH6XstEsJMV5qNivB+Kul9JE3d7bP9eS9v71Hne6mwywR35Pg1K8iJfkJzgTVheUevCIWeEyRxsf5ELPwjQsV1Ic+UQlzBj3mSTvIOiXCMn5bsf0JRM/xsbEwxtfvQGqnCeky4je2TZ/Do6ExeiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c9z1rL7c; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C6A8C4CEE9;
	Wed, 30 Apr 2025 08:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746003394;
	bh=t0sNMjfpZFZ/tkTiw1mOgfiMQQ17CSRGsWtVuNG7b3M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=c9z1rL7cXAvea45Uyb1S7z/e1pr/opZE+xb/RnFZg415G2WHkhlO79SJESttOR1cK
	 alsnzzGFp1a9vglABQHYufpsaENCJReoJKYvw3rW1P07pDyxuhNrJB9Hv2whY1zbkQ
	 LICYFqpXcVDuBQXUuZxsqmjbQ+nrxekwNLz3cOk6+qM0ZRCJqUkckAW6wgYSduieV9
	 ssF00vMrT6XJMDO/lH4XtKFB/rYrLyqyMyHBWtbEx/dBET/flRENE5zKIJC/8UvaQb
	 iwDi3/lzR6+L0I0gWgGd0oGK8yAmKjVqEXuMz/y1bjUX5VRloiKFKN34tDJQpBNAgH
	 CepiUEM7FPWfA==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-leds@vger.kernel.org, Lee Jones <lee@kernel.org>
Cc: jacek.anaszewski@gmail.com
In-Reply-To: <20250424144544.1438584-1-lee@kernel.org>
References: <20250424144544.1438584-1-lee@kernel.org>
Subject: Re: (subset) [PATCH 1/1] leds: Provide skeleton KUnit testing for
 the LEDs framework
Message-Id: <174600339289.3131178.10970055458890624899.b4-ty@kernel.org>
Date: Wed, 30 Apr 2025 09:56:32 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-510f9

On Thu, 24 Apr 2025 15:45:38 +0100, Lee Jones wrote:
> Apply a very basic implementation of KUnit LED testing.
> 
> More tests / use-cases will be added steadily over time.
> 
> CMD:
>   tools/testing/kunit/kunit.py run --kunitconfig drivers/leds
> 
> [...]

Applied, thanks!

[1/1] leds: Provide skeleton KUnit testing for the LEDs framework
      commit: 72a3aadde656a6df096221c3d7fecb76ccb5619f

--
Lee Jones [李琼斯]


