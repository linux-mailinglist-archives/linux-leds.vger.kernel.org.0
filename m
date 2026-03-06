Return-Path: <linux-leds+bounces-7127-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IO49IrrCqmlXWQEAu9opvQ
	(envelope-from <linux-leds+bounces-7127-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 06 Mar 2026 13:04:10 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 35508220100
	for <lists+linux-leds@lfdr.de>; Fri, 06 Mar 2026 13:04:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2E2083134DB2
	for <lists+linux-leds@lfdr.de>; Fri,  6 Mar 2026 11:59:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0953637FF5B;
	Fri,  6 Mar 2026 11:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ue1mQtC9"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D992F368276;
	Fri,  6 Mar 2026 11:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772798380; cv=none; b=cCS50P/EigSkFGigVwl3PcqWOJYGu/kTjM/sdfFEb5WzGPlbPXuhIVzO9p5YQFIJAqrxk9IZNb9/RAJzK2ufzzsPSgxNFBtE06YbWfpvxdRWuPx+T86OgdCb9gBTNjqqFWeiWHsMSDg3c28dPspJHjYQJ8vJK3R5vL3oD1EfsU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772798380; c=relaxed/simple;
	bh=ZgIjA3a02DfAd4XUeUuMK71JltwD2i7WNE/yBPvAVnU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=nnH5PLMj4x/h4f/xgZE2wmUihn1nTqUTTAeiMc7vJKFi+I2LhyBMSgxr2TMyBhQeoUo46+OjwLCrTkEMXRlnKUcZsd1DopQgm25pKF5AeOVBHsqEY8jixIEuUAJ/7MXYq8CjBBOSIP866dWoPMp+lwkQRwOVDixUPm+4Npf7RJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ue1mQtC9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F6D7C4CEF7;
	Fri,  6 Mar 2026 11:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772798380;
	bh=ZgIjA3a02DfAd4XUeUuMK71JltwD2i7WNE/yBPvAVnU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ue1mQtC9SgziZCZchPNENlfgE6W513Btnmkw3hmNq7Yte4lJsXaz/0AaCDyR4yOc/
	 0xYBy55j5OkRe3y6E6pSfB83Im3LYx8/L8gcT5TZl0E44fcsWSfWYmX7EdI094vGMD
	 7NE7kCPAX1ZvFm1f56osdU/5uYDv6vTnhIbbjaYumKHrXD9T6o4yN9Rs3Mclb+Ov47
	 YgWruO7+WST0mEJjmMWc1/IZG5/ISEymp4TInQbdAnAFxXVIC+UyNX3lpZVUmrLIjx
	 +HkqoBrU8MqY+3IIV3IdzhsQiVQ1fATAu5jPxRb8UeTN695VlOdWSdSrCD5jcSfAt6
	 1kFiGHHV8npQA==
From: Lee Jones <lee@kernel.org>
To: linux-leds@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, stable <stable@kernel.org>
In-Reply-To: <2026021934-nearby-playroom-036b@gregkh>
References: <2026021934-nearby-playroom-036b@gregkh>
Subject: Re: (subset) [PATCH] leds: qcom-lpg: Check for array overflow when
 selecting the high resolution
Message-Id: <177279837896.964017.15766501896548575720.b4-ty@kernel.org>
Date: Fri, 06 Mar 2026 11:59:38 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38
X-Rspamd-Queue-Id: 35508220100
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7127-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Thu, 19 Feb 2026 15:34:35 +0100, Greg Kroah-Hartman wrote:
> When selecting the high resolution values from the array, FIELD_GET() is
> used to pull from a 3 bit register, yet the array being indexed has only
> 5 values in it.  Odds are the hardware is sane, but just to be safe,
> properly check before just overflowing and reading random data and then
> setting up chip values based on that.
> 
> 
> [...]

Applied, thanks!

[1/1] leds: qcom-lpg: Check for array overflow when selecting the high resolution
      commit: 292aeaef0a0c3aa6f32c9e12d77503bd348c0e7a

--
Lee Jones [李琼斯]


