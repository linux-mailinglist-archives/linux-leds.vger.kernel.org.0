Return-Path: <linux-leds+bounces-7517-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UHKBDDT/xGkz5gQAu9opvQ
	(envelope-from <linux-leds+bounces-7517-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 26 Mar 2026 10:41:08 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A39EF332787
	for <lists+linux-leds@lfdr.de>; Thu, 26 Mar 2026 10:41:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 81B00305324A
	for <lists+linux-leds@lfdr.de>; Thu, 26 Mar 2026 09:32:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 568B934889F;
	Thu, 26 Mar 2026 09:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vLt2Eps5"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A97934751C;
	Thu, 26 Mar 2026 09:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774517535; cv=none; b=ovm3zi/9Xg6CxAEEnSfrbfKfkE/LU4IbY/e/QnU5605iqzfAv9IqWyl8W8hHqrG2xsfERPfm3iFe4ilVurUHf7zlx+zAicXTS/jRMpjrzQYbNa7fojaqmpB+rX3W7u7nNBOIqiwnjMPoWjg3wAay5Ji6b5lkQZDYQMdQyHUohro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774517535; c=relaxed/simple;
	bh=Eyio1EiCGp5TcRzdbDSUF4iB1OKQ8SxmQVWyCx2px/Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jgI9EToSidwIH+1kAlQ8mUvRfBqPaIZ3dpf3+fgAvKjYUR3HEk4wDiTmjjjuSW4oha5yrT9GtGA34ty7N0HnEJ5y8pawmrsmnTfSoi4lEcaYKWgtWc8TGITulqwzWGIii47fQ+hklvswwoGjVLqkA8qAyIvO63hUlMU0G7hUYHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vLt2Eps5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6DEDC116C6;
	Thu, 26 Mar 2026 09:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774517534;
	bh=Eyio1EiCGp5TcRzdbDSUF4iB1OKQ8SxmQVWyCx2px/Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=vLt2Eps5rMzRV5ehBuk8D0n4neHmrxqfaLfPsEVdz4e6A0pypCCMhuJT0aRIdYheR
	 vbfTqHt180m3VA6LnwqE/TnRHeuMiOLnsbYXTBG1HDwZF6ZEKleK99+3ozzak91HB8
	 v1nG7niqF9RrLLEpvTXbvyr3BUcjXX+HOulP2pCuaTaJK0HBzDm2Y5B0npDdFg2tm4
	 JWcP4FokcCRQBlWqPCUgP+d/D5Sl7NPavyVlD7Fax46r6c8Cv1FSAdsQywPeCMP7zi
	 L6cae4cqfh4+vmKZstq6li58+ej25n4bYDj282zZRPp/GgCgJC5nKbFKHDKDgfZzWk
	 pM/1DyI8TwR1A==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260311-led-swnode-name-v1-2-798a49e041c6@gmail.com>
References: <20260311-led-swnode-name-v1-2-798a49e041c6@gmail.com>
Subject: Re: (subset) [PATCH 2/2] leds: core: fix formatting issues
Message-Id: <177451753339.1867408.2785898838522534835.b4-ty@b4>
Date: Thu, 26 Mar 2026 09:32:13 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-7517-lists,linux-leds=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A39EF332787
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 11 Mar 2026 18:43:28 -0700, Dmitry Torokhov wrote:
> Fix formatting issues reported by checkpatch.pl, such as extra empty
> lines, lack of braces on some branches, and misaligned function
> arguments.

Applied, thanks!

[2/2] leds: core: fix formatting issues
      commit: 91dc0c2a152373c4004df7e36de45190b82089ab

--
Lee Jones [李琼斯]


