Return-Path: <linux-leds+bounces-8330-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +LnvK0MXF2px3wcAu9opvQ
	(envelope-from <linux-leds+bounces-8330-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 27 May 2026 18:09:39 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F615E77CA
	for <lists+linux-leds@lfdr.de>; Wed, 27 May 2026 18:09:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 68F6C30191B9
	for <lists+linux-leds@lfdr.de>; Wed, 27 May 2026 16:01:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC0183E8341;
	Wed, 27 May 2026 16:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FfiTrSxP"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEEE43DE44D;
	Wed, 27 May 2026 16:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779897701; cv=none; b=b/Z1yp3npsl82mEhsqghpO4eYLFLsNPgBymVbhZBnpY9CU0yLeoN8S4ubdPWJjWXMPJaerKhegVdKMlulAtunWlvWglr7leZKrxTGub5cWKVXbfBJrlh3yj4dGWXNvNpuSxao9JjNg4GRKGwaJrC1Msueu1VgmDd3cFuTEbZM1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779897701; c=relaxed/simple;
	bh=s0NanPkVpqVf8wNmLBLEzeXH29vAw9y2L3Ua0hVKjWQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=a3N8yH6x6gAk4plWl0OL98ppy00NET/mXon8IizE8tcC0hP9sm1LRnkJFLIoQxA1GdKkNy9IUrNTlwGc0EZIddLTSrkYLy9gyDhcg972FGwsx6SPRGI5iRIme0RT3DEM89DD5prKoRa1ZUVDIEzcrfgUHmsklx7DaxYhVejIDtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FfiTrSxP; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3E311F000E9;
	Wed, 27 May 2026 16:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779897696;
	bh=ZDQr4OI9gp3C46A8h+Q3BTBQOdfHsbqXOtecpZAGI3k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=FfiTrSxPOYi9QQQ5c3ZaBXU5tch90OkWPdH5haJMMy6uE0LbtZsSYnVp/bFqBZJ3P
	 pnfA0mNyjzxt6jN/mdaXaaWpslFm/snGa/konoYqsbE4+nG2zryLVnnujcWZJe3M8O
	 p8+lT88Kk6XaBXaSEpjreQK9muTcZpDzRVyJiBeuLyoHHU7BG22QRmQyauyo7KX33m
	 ZlXnlKXzO5vThgHc/qhG5wBSyDfOwEh2lIVaV1wO0M3bkiRSwHZq3FNXmT2n44vgvi
	 E3rm0oDkJ0prbx+bLwPVnyexQKTUOSgqJuEcfRkxbNTQSE58ZyD+rj3DIRAfPregEl
	 O4W5cBPlMClvA==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260521-cros_ec-leds-hw-trigger-brightness-v1-1-6cd9d7c9671e@weissschuh.net>
References: <20260521-cros_ec-leds-hw-trigger-brightness-v1-1-6cd9d7c9671e@weissschuh.net>
Subject: Re: (subset) [PATCH RFC] leds: core: Report ENODATA for brightness
 of hardware controlled LED
Message-Id: <177989769567.799142.664764680088051149.b4-ty@b4>
Date: Wed, 27 May 2026 17:01:35 +0100
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
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8330-lists,linux-leds=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 34F615E77CA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 21 May 2026 18:42:41 +0200, Thomas Weißschuh wrote:
> While the LED is controlled fully by the hardware, the value cached by
> the LED driver core is incorrect. Return ENODATA to userspace in this
> case.

Applied, thanks!

[1/1] leds: core: Report ENODATA for brightness of hardware controlled LED
      commit: a654a32798325a8b6fc9697b6029b402e0376e31

--
Lee Jones [李琼斯]


