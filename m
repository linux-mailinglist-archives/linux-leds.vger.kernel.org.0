Return-Path: <linux-leds+bounces-4873-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 973EAAE7B7A
	for <lists+linux-leds@lfdr.de>; Wed, 25 Jun 2025 11:06:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9AB373A4ACF
	for <lists+linux-leds@lfdr.de>; Wed, 25 Jun 2025 09:05:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C94E027FB07;
	Wed, 25 Jun 2025 09:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bqFhGC+y"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA5827281C;
	Wed, 25 Jun 2025 09:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750842372; cv=none; b=RflnQBRiFhJ1Zwp9i8dLgIeb0fJ6mGhFuNMUFgPsGZzk4iYtjJx8ojjINDWY2EKW0KDcsffT/UWdTZ9D+sFMrcECBHvVEirdfNVb1Q4lpqIkZedsPdlPccmxC/7YDQgKLhw/fIz2P/FFc9mWpGvrdSrAZz9tdDZfbN6oOj4IskU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750842372; c=relaxed/simple;
	bh=YjtRs4wsPRg2gYdjsvwLqd6q3JwrNmEOkA721Ah6kQc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=QVPPyhJoOoD+jRBYuck0jc7M1YPGBvw7yNB2LI3idwtJfwgHAFwT6JD1suydaz+lrgobub5R28wAe3ZW89ZXBknoK1PcXk2UntTeaARxBN2nDdjsoRttqbd/58fHvfvzaUjxQXW4u6D4Bpmya6vQVW1KVDBKlsF3/WAY5dFmX5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bqFhGC+y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19AC3C4CEEA;
	Wed, 25 Jun 2025 09:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750842372;
	bh=YjtRs4wsPRg2gYdjsvwLqd6q3JwrNmEOkA721Ah6kQc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=bqFhGC+yqPbKuMRvwEnTEGK3ZE21ghxWeyp4c4v6p6ynj9CJa5u7gv4vqRuL+YVsQ
	 rNY+n8Rkyp3/q7iencBFU//C0IXA/n+JX/JHT0qIRqOaiWQjumRPvrYFXaqO25fZQG
	 K8NL1nTWk/hbLfHUl4hsqYhncAxnSrEuMil65z4T5LfJCy+3UJ19J0baYVW8mHeood
	 dqCWNx3qPHQVKaZTkTkCVA6wJ4N3WaOuz7BOePTV3mcLLJMvg1AVHo9Amc+/JaeJBb
	 VK1rbReG6wejNcBtO2+FdcZD7ZoPv/SsJ+2kd268GFSoLFup+m21qywA61TqOOmT3v
	 7Ql7EdIKQthLg==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>, 
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, 
 Johan Adolfsson <johan.adolfsson@axis.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@axis.com
In-Reply-To: <20250617-led-fix-v7-0-cdbe8efc88fa@axis.com>
References: <20250617-led-fix-v7-0-cdbe8efc88fa@axis.com>
Subject: Re: [PATCH v7 0/2] leds-lp50xx: Support reg to set multi_index.
Message-Id: <175084236984.4074918.12825777412065581866.b4-ty@kernel.org>
Date: Wed, 25 Jun 2025 10:06:09 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-c81fc

On Tue, 17 Jun 2025 12:23:53 +0200, Johan Adolfsson wrote:
> Since devicetree nodes are (sometimes?) processed in reverse order,
> support reg as the actual multi_index index so yo get well defined
> color order presented in the multi_index file.
> Not sure if reusing reg for this is the correct way or if another
> property such as "multi_index" or similar should be used instead.
> Looks like reg is used for similar things at least.
> Or should the whole "reverse the devicetree" problem be fixed instead?
> Update bindings to match implementation, and add description for the
> reg property.
> 
> [...]

Applied, thanks!

[1/2] leds: leds-lp50xx: Handle reg to get correct multi_index
      commit: f0022183bfd939f7d3c669cca0bf3aade233c9a5
[2/2] dt-bindings: leds: lp50xx: Document child reg, fix example
      commit: d07927c0ca918a6825ef46cb7c012dbc102ac352

--
Lee Jones [李琼斯]


