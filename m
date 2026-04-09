Return-Path: <linux-leds+bounces-7665-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ELRIOUjQ12mrTAgAu9opvQ
	(envelope-from <linux-leds+bounces-7665-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 09 Apr 2026 18:14:00 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC203CD7D7
	for <lists+linux-leds@lfdr.de>; Thu, 09 Apr 2026 18:14:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 44BE230D94DB
	for <lists+linux-leds@lfdr.de>; Thu,  9 Apr 2026 15:59:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51C0D3D5668;
	Thu,  9 Apr 2026 15:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JDR4Fawi"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E08C3624DE;
	Thu,  9 Apr 2026 15:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775750339; cv=none; b=N/jH3DrDNqpXoDpRDU8QaDv05KEgMNud0IFbT43/GkQCxLSuhUlj5wGwc5CIsOcGFs01++GLM1qWqZMiHA891WWaC3NMHflxyHE7WZYAb03JcxbxhjsHXC+RY7Z5WHJ5eMxU1T0z4xJmA+YBSd4ESJbUuFvZgDrujyIFRSqx2R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775750339; c=relaxed/simple;
	bh=0Y8+Y3aVQd6jlXi23aRcY14C53QH1VAfgZc+1gg5uxk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=RP3khIqiTcMUsGXUcqP3lSgJVCRMiqH/0W7LS35QS9ijWvDBnGhkr2sj2QfAswI9cIVJsHW4budyXr416asxB6igrIm3+N1xs1s+4/hqUzCKDJVnc+i4pFQCIZTwM24RGnFS6b7i3G81VxgtIyY2kkzZ25nm6KHaIRs+nNahkkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JDR4Fawi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 530C4C4CEF7;
	Thu,  9 Apr 2026 15:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775750338;
	bh=0Y8+Y3aVQd6jlXi23aRcY14C53QH1VAfgZc+1gg5uxk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=JDR4FawiGbV6ut8UWRvVbQyDgt/iJdPhLPgcaifmO+GitR68gXxaIhpztquNNeQIj
	 Jem9UcALrqY3hP3KmFBWJPMUBifiUsL9ETHytq0adf4eaanZnxUjOZ7stCOP2t5UOC
	 ruVlohqrJKNw2GKBspFElYHpPOxWoSgqLj2d1KlHoZosdouV3/jAKjqXTtctuT4RNy
	 b2RwM/R2NVGagSoyiUZ9hBgdyGRhBaIVhfuvLoYwdUvEfhxgXUH0T5BjyUj7sKiRs/
	 w+qNk74VIkUxbdf//wvX2HiDz+yQeXwxkU5Cb5+jhmSQo8Zb167BTnjH+8C6fDDG8l
	 HsfStDq3OeCdA==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org, pavel@kernel.org, 
 Tobias Deiminger <tobias.deiminger@linutronix.de>
Cc: eajames@linux.ibm.com, riku.voipio@iki.fi, linux-leds@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260331202848.658676-1-tobias.deiminger@linutronix.de>
References: <20260331202848.658676-1-tobias.deiminger@linutronix.de>
Subject: Re: (subset) [PATCH v2] leds: pca9532: don't stop blinking for
 non-zero brightness
Message-Id: <177575033707.3456614.18417939650401670838.b4-ty@b4>
Date: Thu, 09 Apr 2026 16:58:57 +0100
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
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7665-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6DC203CD7D7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 31 Mar 2026 22:28:48 +0200, Tobias Deiminger wrote:
> pca9532 unexpectedly stopped blinking when changing brightness to a
> non-zero value. To reproduce:
> 
>  echo timer > /sys/class/leds/led-1/trigger   # blinks
>  echo 255 > /sys/class/leds/led-1/brightness  # blinking stops, light on
>  cat /sys/class/leds/led-1/trigger            # still claims [timer]
> 
> [...]

Applied, thanks!

[1/1] leds: pca9532: don't stop blinking for non-zero brightness
      commit: 770edd8e8e5bed961af2ca6ab397052046d1d774

--
Lee Jones [李琼斯]


