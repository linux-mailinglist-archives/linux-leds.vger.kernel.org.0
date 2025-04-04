Return-Path: <linux-leds+bounces-4393-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B67EFA7BBB1
	for <lists+linux-leds@lfdr.de>; Fri,  4 Apr 2025 13:39:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 834C9179139
	for <lists+linux-leds@lfdr.de>; Fri,  4 Apr 2025 11:39:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71C93146588;
	Fri,  4 Apr 2025 11:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pTqbZj1n"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA011A83E2
	for <linux-leds@vger.kernel.org>; Fri,  4 Apr 2025 11:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743766794; cv=none; b=jG1QCLXFxWWjJdEvT6C1s+YNHieMiLc5xSTDqoAVt7uzngc79fMDkMAOa6ckQyqOLBpntLi6XpdqBp/QrDmnJIiQLmDSSCiOtqeEoGfbsVPRVWrkyyLIDF68JUkQe6fssU6z2elmYPUUyzX8et15PRYpzrtfO28pIFV4yk8r110=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743766794; c=relaxed/simple;
	bh=qlUrWQOEv5NDP/3PssCbDW6uyeeAVaDr87XSTGKHvYA=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hKIRsN1SwN1lLf6QD3kXISy87eG4+Slv6lo5izQ5yK1LraSK9eM89hH6pYCpGarnX9LuXwU+H0C2XY+bhfnKnsnzqHGnyVgMtdNRO3EyXk0TnMnNjhPjPyDhJREuV1G/ofOO3SQ2wBFDNcRQO886WBk02YlvLWzBow/5oUx+cUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pTqbZj1n; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 066CFC4CEDD;
	Fri,  4 Apr 2025 11:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743766793;
	bh=qlUrWQOEv5NDP/3PssCbDW6uyeeAVaDr87XSTGKHvYA=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=pTqbZj1n6ut85EaDLF3hgXnlyctPOpy6wmACILzCLR5+IYMQ5lygZzaBJBk86IsbI
	 Is4Iy75c6mhnfD415xLg6aY5OTaaS41bNH9TXiRbRpEitC2JthbUBPSPr/HZgwhwyC
	 AMXyOTPdJVo0Maf8LjTlanaTF0OTUDTtqWglk7eJr03VC/bOECBwYP3E1GgBPNBXkO
	 pfkASEyLCc7z+aYcu6gE9Vd1b0FzNee4XRZdf9kfStfhYm5fip5ZXuVVjV2hPY1U5Y
	 t1jZEOiYHruLoji60ZDCvWjL09uefULBbAgdPJBDrARaq0iWI0NAnuOgAqENpqd1lW
	 Jgm8mATDOcRKg==
From: Lee Jones <lee@kernel.org>
To: linux-leds@vger.kernel.org, Craig McQueen <craig@mcqueen.au>
In-Reply-To: <20250317022630.424015-1-craig@mcqueen.au>
References: <20250317022630.424015-1-craig@mcqueen.au>
Subject: Re: (subset) [PATCH v4] leds: led-triggers: Improvements for
 default trigger
Message-Id: <174376679275.274259.1964793229260443862.b4-ty@kernel.org>
Date: Fri, 04 Apr 2025 12:39:52 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-510f9

On Mon, 17 Mar 2025 13:26:30 +1100, Craig McQueen wrote:
> Accept "default" written to sysfs trigger attr.
> If the text "default" is written to the LED's sysfs 'trigger' attr, then
> call led_trigger_set_default() to set the LED to its default trigger.
> 
> If the default trigger is set to "none", then led_trigger_set_default()
> will remove a trigger. This is in contrast to the default trigger being
> unset, in which case led_trigger_set_default() does nothing.
> 
> [...]

Applied, thanks!

[1/1] leds: led-triggers: Improvements for default trigger
      commit: c050003bf86c541cd740997420847e8b5b74194b

--
Lee Jones [李琼斯]


