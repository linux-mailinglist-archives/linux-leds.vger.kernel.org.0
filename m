Return-Path: <linux-leds+bounces-7105-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GBpxFtu+qWnNDQEAu9opvQ
	(envelope-from <linux-leds+bounces-7105-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 05 Mar 2026 18:35:23 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE2621652C
	for <lists+linux-leds@lfdr.de>; Thu, 05 Mar 2026 18:35:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5AED330607AE
	for <lists+linux-leds@lfdr.de>; Thu,  5 Mar 2026 17:31:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40B113D564B;
	Thu,  5 Mar 2026 17:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kRACvwRB"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E72D3803E9;
	Thu,  5 Mar 2026 17:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772731904; cv=none; b=LnFEQ3M+3rXoWZbbGvbH4yhtkHEBKNExbYvjuxxKggr/p0n9gJjv8h5Fh1qee1D/hv0xQHu6r8SDuVFqQZ6Rx+v7R+DnIA5Hwe3Sr+mzWrcQkYjVBQiWyTPiYnZ7dlUx4v/MiGvJ242nph8H0rrZe3UYaSQVFJlwZuy0X1ZOeDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772731904; c=relaxed/simple;
	bh=Qie5osW0uZ2sQL4OaaO+w1LxzvHpSS8rilA5iVzLsT0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dUcwHcRR99QL3cgBYJ4G5uKlBK7muuhKAfkWuJ1GyvnocAJUY/L73WfCg/+TEmd88e/vsPCArgANSAZzCwTd2ozj39LjKrJF6Pk2tm4yulerEsffi3S0cpgdeoe4wueXDxaZj9f50dEPqMJUDacTWOGjjSYtqA8Q1VqmRZt2cRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kRACvwRB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0FDBC116C6;
	Thu,  5 Mar 2026 17:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772731903;
	bh=Qie5osW0uZ2sQL4OaaO+w1LxzvHpSS8rilA5iVzLsT0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=kRACvwRB+BfjZpPt/KTlPxQGQUFMGFlx1kl8trRdDuwYZqFZ8ir4bOG74v5bC8ke9
	 wr1f5IA4h1nUj1USraRNN//Oeg3r+d4aa7APMjj47NiKgWvjDHy+7HMARxh0HfwVtv
	 h+2WEsI1jKVbMMupQy5uQRVNWIkRL9fDtDxh8HBvyn30NldC5bLCbUumrGnkQH8HWY
	 i4y1FJugZ5J+v64IkCXM1UEnwAIUmX32Zqdw9+LE4xIBEq3cDSjvqwkIy0vEBPrjCK
	 e8OQJlWaW0WvYtvSck/zjrPPBua2Z+fd1TpQWWjsHD7KgNfJMVFiD/qLOJvdfgTsaq
	 gpGPgbao2jMkw==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org, pavel@kernel.org, Neel Bullywon <neelb2403@gmail.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260207181825.13481-1-neelb2403@gmail.com>
References: <20260207181825.13481-1-neelb2403@gmail.com>
Subject: Re: (subset) [PATCH v1] leds: lp5569: Use sysfs_emit instead of
 sprintf()
Message-Id: <177273190239.340952.15045169891533731436.b4-ty@kernel.org>
Date: Thu, 05 Mar 2026 17:31:42 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38
X-Rspamd-Queue-Id: DBE2621652C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7105-lists,linux-leds=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Sat, 07 Feb 2026 13:18:25 -0500, Neel Bullywon wrote:
> Replace sprintf() with sysfs_emit(), which is the modern standard for
> formatting sysfs output.
> 
> This change aligng with the kernel's best practices and ensures usage of
> the most up to date API.
> 
> 
> [...]

Applied, thanks!

[1/1] leds: lp5569: Use sysfs_emit instead of sprintf()
      commit: 1db4b1d941f7453ba2922e32c0f2bd1216cb3ae6

--
Lee Jones [李琼斯]


