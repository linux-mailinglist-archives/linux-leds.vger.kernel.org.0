Return-Path: <linux-leds+bounces-8326-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UBfhAt4JF2pB2AcAu9opvQ
	(envelope-from <linux-leds+bounces-8326-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 27 May 2026 17:12:30 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D86CD5E6A16
	for <lists+linux-leds@lfdr.de>; Wed, 27 May 2026 17:12:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6EFF33012B0D
	for <lists+linux-leds@lfdr.de>; Wed, 27 May 2026 15:12:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D41142668E;
	Wed, 27 May 2026 15:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F2Um7UJF"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770B03BE635;
	Wed, 27 May 2026 15:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779894748; cv=none; b=UkYPfJegaWOMWkVi3N1K/nI8bmrceTfHClV0SE+IvfgdGsyh1uMX6EoQ1wEFeB72vEt6l153IrN/BlwYPdIXTq+Q1L3/qQXYuk8N07HFGg2rnjykGBjRndlGEN/SlnVpcQLlCWK+oat0+WFmJYe0xujIKV8Q3djFJId7iCqq8CM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779894748; c=relaxed/simple;
	bh=48mGc3kLEQncBz1ZFMmrzdFfnAmFNUWVe7d1/a+QTtA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ShDt+x8kS87hFw6ETj+czK332MJ+1qGRAtvoxoSA4sNCsa+h+m4QP0tOHpK+ks2GriN274EKzC1au4SRVgJ1VWqtGG5PZArgCG7d0U6rii12mUSjVfyDNHSq/QZGd6uE9pw+4yHdl39Bcygwi/ACUlqJmFIouyYBW1xszm0eKPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F2Um7UJF; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34BCE1F000E9;
	Wed, 27 May 2026 15:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779894747;
	bh=4Up06g5MJwmonMECIKMCRc3erP96nBO7ojr/YyxBGsY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=F2Um7UJFgrMsGciExdxUE7v8nUodrKF1oCu0+EphlwChK6fi5vqhHAfQh6Pqhj5Uz
	 CciVqySIcbB5kYoedR9AqTaYHq3Q7fdPpRpifWQPInyw+kLj0E/BQVR97yvXzefBi7
	 GbCSq/J5EIq//0W5Ndyz3eDSj5ZGOHFcwH8SffqcxhP5v6Yxa10qc+pMvBl5+VxuFh
	 l4aX2v1SJCZsTPOsXPkvD1RYSXHo1ASH3VVAE88gI+Ca0Jl0FRthj7lGehCJrQh2SL
	 U127iNzEhG7mpVe0mM0roGKMPGVNcVzb84UayntOhxw9kHGJ+ntKoD0GIKUuKiPath
	 QJARAs5HcZQtw==
From: Lee Jones <lee@kernel.org>
To: linux-leds@vger.kernel.org, Alban Bedel <alban.bedel@lht.dlh.de>
Cc: Pavel Machek <pavel@kernel.org>, Lee Jones <lee@kernel.org>, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260513115853.1584230-1-alban.bedel@lht.dlh.de>
References: <20260513115853.1584230-1-alban.bedel@lht.dlh.de>
Subject: Re: (subset) [PATCH v2] leds: class: Use firmware nodes for device
 lookup
Message-Id: <177989474597.709655.6083515940845325663.b4-ty@b4>
Date: Wed, 27 May 2026 16:12:25 +0100
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8326-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: D86CD5E6A16
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 13 May 2026 13:58:53 +0200, Alban Bedel wrote:
> Replace the OF based lookup with the fwnode equivalent to get support
> for ACPI and software nodes.

Applied, thanks!

[1/1] leds: class: Use firmware nodes for device lookup
      commit: 38cb54cada737fd9511dcb5d1a7cca728b81571c

--
Lee Jones [李琼斯]


