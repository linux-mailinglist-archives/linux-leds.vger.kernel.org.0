Return-Path: <linux-leds+bounces-7924-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gLyjCy5G82kMzAEAu9opvQ
	(envelope-from <linux-leds+bounces-7924-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 30 Apr 2026 14:08:14 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8E24A295D
	for <lists+linux-leds@lfdr.de>; Thu, 30 Apr 2026 14:08:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9938430191A2
	for <lists+linux-leds@lfdr.de>; Thu, 30 Apr 2026 12:05:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35CE7401494;
	Thu, 30 Apr 2026 12:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T56jwRP+"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C4F13D8108;
	Thu, 30 Apr 2026 12:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777550721; cv=none; b=sx1TMFdGJpEN2kVMtIeqYYzGU0zPM6r1HaH5hnF+gWheC3Xi34U3BuN8mlItlZ8LEXPmQ1MVyHywZN54hYQtt2HxOUo72tigKEhGGR24j49xx7xUCElZIBZTsEaDSnfrC3x0aqmW3TOjKbBij3Hf+lEg62b0pTCWdA7NnLH7M6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777550721; c=relaxed/simple;
	bh=N3ibTp/BgHed4W4JS06DUX60o/hXHOy7wdQiF1emRDk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hGwVDfEd053uA9xYIMmhPCUu+KSuE0KwmVRVN9GhLbtkfJ7MInr+/FOi7Ovr6nF4JW2zC0LdQFAr/mgC6YztqBm5wVcY+LA6ib7y7vStxadFTlVDhbY4tCdUviklm0njS4c3CwXyUDA2M9/a3W6TYXoWGantfThsdDJOL78l0iU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T56jwRP+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61637C2BCB3;
	Thu, 30 Apr 2026 12:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777550720;
	bh=N3ibTp/BgHed4W4JS06DUX60o/hXHOy7wdQiF1emRDk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=T56jwRP+Yrvr8MD+cdOrWfUtBEE1bCfUgy4fO8YIt/oYtmvaFc5yyStxbJ5PTy0Wu
	 uNsk5xlxPAK90vRhz/PP3MSq8Te82L0yX/neLPb4iRIlfoyA3YRt4m0SeVoaNXt2QK
	 t3JBF5l/3ykkcC07ARBqXIBYLOzfDzu+Lgce/Zk4Q4PSaz//Jd/6W8A+eZTBeRNUQS
	 HQ0yEKrEsuXqsksf9Iidmk/DslX0jGKzmMGYnEl37/J7PU4/AHNU3NKZb+wwbA9ksZ
	 cYE18BPqs94mr8PB5XJonV4o4IWfMFYIl5CClShrhkvmp0acl8PZwgsJwxqFXMBmNz
	 mZFf529W684Xg==
From: Lee Jones <lee@kernel.org>
To: linux-leds@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
In-Reply-To: <20260409171555.14580-1-rosenp@gmail.com>
References: <20260409171555.14580-1-rosenp@gmail.com>
Subject: Re: (subset) [PATCHv2] leds: qcom-lpg: allocate channels with main
 struct
Message-Id: <177755071913.2532373.14484106102818819726.b4-ty@b4>
Date: Thu, 30 Apr 2026 13:05:19 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c
X-Rspamd-Queue-Id: CB8E24A295D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-7924-lists,linux-leds=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Thu, 09 Apr 2026 10:15:55 -0700, Rosen Penev wrote:
> Use a flexible array member to combine kzalloc and kcalloc. This
> required moving the struct lpg_channel definition up as flexible array
> members require a full definition.
> 
> Add __counted_by for extra runtime analysis.
> 
> 
> [...]

Applied, thanks!

[1/1] leds: qcom-lpg: allocate channels with main struct
      commit: a745987dfab917a64188e22a30d427080e044aac

--
Lee Jones [李琼斯]


