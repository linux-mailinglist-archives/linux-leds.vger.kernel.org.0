Return-Path: <linux-leds+bounces-8103-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uM+uIwe6BWpZaAIAu9opvQ
	(envelope-from <linux-leds+bounces-8103-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 14 May 2026 14:03:19 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 361385415A5
	for <lists+linux-leds@lfdr.de>; Thu, 14 May 2026 14:03:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 317653014972
	for <lists+linux-leds@lfdr.de>; Thu, 14 May 2026 12:03:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE1423AEF4F;
	Thu, 14 May 2026 12:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iOY3Nlwn"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB7C439A058;
	Thu, 14 May 2026 12:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778760196; cv=none; b=JYzRm5f3aUe8KLA4Nz4dsxHnfg/rr7SjU8VvgxpcDea9Q7sk03tECaJZrpP5WccEkCSKu89iRFPLUU4HIrESsgEGkdPDGYRDi5ZV8yzYnmo8m3kp/owLyMKeiz9kz/+JBYS/KfBE2W31ThF0KyCoM13wqaUQmkAp+0JIjzq3Bls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778760196; c=relaxed/simple;
	bh=UYHecIJq8Lz+mIcHZehAgi91My/BeGtx6kMKmKh1dAA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=c5auwnMW3DK4+m9JoTnOPR52oAxBpRqnTVA46YyznOAfgSq+XzOMgfTiEFizSqvDNrJdnduYsH8C0wraJY6oC3tZpgbxC9NCN+Sa9e8/F83VqjwVE8Vo9HUk5RtFDIoWvmKxu4nkP4HF50tudDPkKaIqBNM6nsVuoqc3sNBTOb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iOY3Nlwn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C62DC2BCB3;
	Thu, 14 May 2026 12:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778760196;
	bh=UYHecIJq8Lz+mIcHZehAgi91My/BeGtx6kMKmKh1dAA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=iOY3Nlwn9M7qTQ506qgNk1zgij/TovMVK2v0uL/fIQJsr+HuNF4Q9eVosoHURF3fm
	 glo6XhMHZEVMh+h5NcK79/zgXblzYtUBGT7csuW7/GXtqb2rSBUbd/dUqDBc3Muqcw
	 6CIsS+zfiawfPmKPi1gfZVEa5qtg8ifBVJARsy20rrnGSRgStJhHZhRnI7cAA82cPz
	 bYNNo+utte4SVNxb/a8cAOF+5IgVGmzWE4PBj0cCH0iK18bPP8JFsq2W0HLNZ9vyFx
	 JJrrLNd29puTfG6T3yuEUPxAsSTkhFtxNIB6nGw/XqLdoP+jUXQBwOH/QSCSJw+0T/
	 Rem5C8btksvYw==
From: Lee Jones <lee@kernel.org>
To: jansimon.moeller@gmx.de, Stepan Ionichev <sozdayvek@gmail.com>
Cc: lee@kernel.org, pavel@kernel.org, linux-leds@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260504123730.1094-1-sozdayvek@gmail.com>
References: <20260504123730.1094-1-sozdayvek@gmail.com>
Subject: Re: (subset) [PATCH] leds: blinkm: fix spelling and comment style
 above lock acquire
Message-Id: <177876019491.2684794.1574797289559940851.b4-ty@b4>
Date: Thu, 14 May 2026 13:03:14 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c
X-Rspamd-Queue-Id: 361385415A5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmx.de,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-8103-lists,linux-leds=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Mon, 04 May 2026 17:37:30 +0500, Stepan Ionichev wrote:
> Fix two issues in the comment above mutex_lock_interruptible() in
> blinkm_transfer_hw():
> 
>   - Spelling mistake (Aquire -> Acquire).
>   - Trailing "*/" was on the same line as text; move it to its own
>     line to match kernel coding style.
> 
> [...]

Applied, thanks!

[1/1] leds: blinkm: fix spelling and comment style above lock acquire
      commit: fbc62317dd6476260df09994729898eb523344a9

--
Lee Jones [李琼斯]


