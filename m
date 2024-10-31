Return-Path: <linux-leds+bounces-3221-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4B29B7FAC
	for <lists+linux-leds@lfdr.de>; Thu, 31 Oct 2024 17:10:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 12AD5B21069
	for <lists+linux-leds@lfdr.de>; Thu, 31 Oct 2024 16:10:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C61C1A0712;
	Thu, 31 Oct 2024 16:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="epWd+AoE"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1529E13342F;
	Thu, 31 Oct 2024 16:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730391042; cv=none; b=iqCxy+y1OmJHkp6uCZEKugXNF3cdQrfxYMCz7+8dRIgFeIDzKjd+JlLYaoDLwosuR3VCUPiJyedXA6sguL+Oitc4WuZvf9z9F+IxQAVAwtfYZHHK48jgum+izKgFXpUhT9Zi7l55I4zNxw9vARa+tdvSL2O2/YLkMn7M/Z+vLHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730391042; c=relaxed/simple;
	bh=4d6mgxmGridH9gvLS7zUL+14pujQhNdiYCfvRt2QC18=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=a3FWqq7GmFVrcGI0yqAXT8HTOyQNuQMQDYjMkLlu6GwnTv58fIr9Y50w7+30fkWlJE7QPz7QRf1Hu0QlwzCEGKSdUq23Y4zft4aItLh1ENZOZq2BXLKV8a2CXQSupJk8ucMkGso6HLwidz5Y9/BaNzKIjJbOP9LOjDkO/LrbbEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=epWd+AoE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F05BC4DDF9;
	Thu, 31 Oct 2024 16:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730391040;
	bh=4d6mgxmGridH9gvLS7zUL+14pujQhNdiYCfvRt2QC18=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=epWd+AoEaThNnPV86I89LKI3zw1z3K21lCh2mfHx5yqkb0T6dswRrZpjjlmoiip13
	 3SItJf7s8l4tD4pj4Ok8YA6py95yf6mEF8p85NWarFtTt2CB9RSQ/+VzTaoj9gp3I7
	 aaNHMLNaHzo8S3xfRPQtSyPScpoMZ+AL59iarG31BM/B3hCIn+rIuQL7HuW166BmwM
	 BLDTuGmjzSUa/Fk3Dejms0YYCfR2WLjkcRv3AJ3OV/Mxhc0bFwunW+49f2ogvFkmbI
	 XSCa54Dunm6cJrm+H2RT7J99dD3qJ5vHAv+gkc2q5042FvnC/bsRxuruem27y/Wxj/
	 BZgtKsZQDMVtg==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org, pavel@ucw.cz, Dipendra Khadka <kdipendra88@gmail.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20241019073302.35499-1-kdipendra88@gmail.com>
References: <20241019073302.35499-1-kdipendra88@gmail.com>
Subject: Re: (subset) [PATCH v2] leds: bcm6328: Replace divide condition
 with comparison for shift value
Message-Id: <173039103924.1797070.1959784060223429346.b4-ty@kernel.org>
Date: Thu, 31 Oct 2024 16:10:39 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Sat, 19 Oct 2024 07:33:01 +0000, Dipendra Khadka wrote:
> Fixes the following Smatch warnings:
> drivers/leds/leds-bcm6328.c:116 bcm6328_led_mode() warn: replace divide condition 'shift / 16' with 'shift >= 16'
> drivers/leds/leds-bcm6328.c:360 bcm6328_led() warn: replace divide condition 'shift / 16' with 'shift >= 16'
> 
> 

Applied, thanks!

[1/1] leds: bcm6328: Replace divide condition with comparison for shift value
      commit: 5f57672cf4629542b525cfef027e293656915368

--
Lee Jones [李琼斯]


