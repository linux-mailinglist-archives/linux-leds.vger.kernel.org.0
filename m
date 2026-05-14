Return-Path: <linux-leds+bounces-8106-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kESLCVfhBWpsdAIAu9opvQ
	(envelope-from <linux-leds+bounces-8106-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 14 May 2026 16:51:03 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A58AD5437C3
	for <lists+linux-leds@lfdr.de>; Thu, 14 May 2026 16:51:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C25C830330BC
	for <lists+linux-leds@lfdr.de>; Thu, 14 May 2026 14:43:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60D4940FD9B;
	Thu, 14 May 2026 14:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ai1tpI3a"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D010410D2F;
	Thu, 14 May 2026 14:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778769818; cv=none; b=b3/il4XibzL+1aWJB/IfAUJxWMz7xamYRsAGHLZxZ4YVr6Hji79hokZg8ixA05JtEUD1ex2N8j9HJSLxxyk8FKrwysU9OXJk9ZBVpfii9PUacmYtRHxo/eln5oWOVJduUTj/PhNtWoPfnCKLbgJVGkNA1BXvrEiXzgTVp41WdtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778769818; c=relaxed/simple;
	bh=vYgSx3dmEm0ZEEAz8YRdNmK7l9u7//QUaR05wrA5BAY=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=g8J0I0DiBEc4NMXNpGR+U6NkCvYXC3j8pcGWa84p2FXZorJRteyVLgA71W9c6cdoXlf5BTqkfR2Y23k9bCZ00/1ZZjynLY4jH1HThgk9U9s7/W58O2B36zcwr6KamZX62EAgYlxywij9CEcyX5ljtEoCyv20U6AyavvBJGZEDoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ai1tpI3a; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 264C6C2BCC9;
	Thu, 14 May 2026 14:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778769818;
	bh=vYgSx3dmEm0ZEEAz8YRdNmK7l9u7//QUaR05wrA5BAY=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=Ai1tpI3aDfb2QvDeKsYxG3EdOoJNoxxp3mZVlKehdBzqRg794VxG0iOi7DInbQjWW
	 5f7sbtOVr5xR7igPW5+7ocZgBoGkbeWY41tUlYkYy036HiHvi5Xs8swWgwYVVODiLT
	 iywtq+BIUTGl4070jjcMHZP0k1maSkiHqT3UhS7D4rVmooCHZzXV30ZHuhpqDK6mut
	 8k2XvUQaYrhCMMxAVuWRJrQ8ovotO45zAb6nC8OX0wv6KQuCrfEuOtsUcvN1OVvg/W
	 eedSkrToE1ol0TTOq8FVlmPCvszgYlT8iLPls+ufdK/azJKbFmTUtUd6nACCOlmxz0
	 LplWwo3DueAWg==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 William Zhang <william.zhang@broadcom.com>, 
 Anand Gore <anand.gore@broadcom.com>, 
 Kursad Oney <kursad.oney@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
 linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260505102846.186219-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260505102846.186219-2-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: (subset) [PATCH] leds: Move MODULE_DEVICE_TABLE next to the
 table itself
Message-Id: <177876981488.2795269.15417552684114266100.b4-ty@b4>
Date: Thu, 14 May 2026 15:43:34 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c
X-Rspamd-Queue-Id: A58AD5437C3
X-Rspamd-Server: lfdr
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
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8106-lists,linux-leds=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Tue, 05 May 2026 12:28:45 +0200, Krzysztof Kozlowski wrote:
> By convention MODULE_DEVICE_TABLE() immediately follows the ID table it
> exports, because this is easier to read and verify.  It also makes more
> sense since #ifdef for ACPI or OF could hide both of them.
> 
> Most of the privers already have this correctly placed, so adjust
> the missing ones.  No functional impact.
> 
> [...]

Applied, thanks!

[1/1] leds: Move MODULE_DEVICE_TABLE next to the table itself
      commit: 7c3d6730e8f03220f48e70ba9d4c05296aa83fae

--
Lee Jones [李琼斯]


