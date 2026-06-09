Return-Path: <linux-leds+bounces-8540-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0TCgCfBMKGpkBwMAu9opvQ
	(envelope-from <linux-leds+bounces-8540-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 09 Jun 2026 19:27:12 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D56662F06
	for <lists+linux-leds@lfdr.de>; Tue, 09 Jun 2026 19:27:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=lht.dlh.de (policy=quarantine);
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8540-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-8540-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9C6F130AE1B6
	for <lists+linux-leds@lfdr.de>; Tue,  9 Jun 2026 17:04:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3B5A4A139F;
	Tue,  9 Jun 2026 17:04:31 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtpfb2-g21.free.fr (smtpfb2-g21.free.fr [212.27.42.10])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AA634ADDB1;
	Tue,  9 Jun 2026 17:04:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781024671; cv=none; b=otbPUuo7k/K+YVB+0kwqccQRPjU8aRqmIh6gN5oKs1kMlI1dnLFG1zKO4onj7HNH4AENlWz3Z7cboZWlDwFL05OGZK3ilkVq64DueQTXAKKjub77XgXwSrtuRAVHDqwfhh4Lg6sUPSm0m7d01KIvG77k3Yyk+UvlGdC3F3YNc7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781024671; c=relaxed/simple;
	bh=qCUycdghp/UEPmnH8YNvmY2XamhSrWOeFjqTFhcV9ls=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=COlAV8rm+cevJko+vQGDVj/zwhaF9FwFzYrbR+Nj94ijNV5SQ652AhdS3s1jBSECi8VbFCb6vIQaXWVuKiZnHqzucJsBPuS0lbziFie87mIww2BEaQUaKRI+g5tF/P+XFlirmP/CoipWyXf/f0nIiZcIQDCOoleSMc0T5PiKXFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=lht.dlh.de; spf=fail smtp.mailfrom=lht.dlh.de; arc=none smtp.client-ip=212.27.42.10
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
	by smtpfb2-g21.free.fr (Postfix) with ESMTP id A6FF44DA2D;
	Tue,  9 Jun 2026 18:54:45 +0200 (CEST)
Received: from omt-cwnxr4tfw5-lht.ads.dlh.de (unknown [88.128.94.45])
	(Authenticated sender: albeu@free.fr)
	by smtp6-g21.free.fr (Postfix) with ESMTPSA id B78F578050B;
	Tue,  9 Jun 2026 18:54:33 +0200 (CEST)
Date: Tue, 9 Jun 2026 18:54:29 +0200
From: Alban Bedel <alban.bedel@lht.dlh.de>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: Lee Jones <lee@kernel.org>, <linux-leds@vger.kernel.org>, Pavel Machek
 <pavel@kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] leds: class: Use firmware nodes for device lookup
Message-ID: <20260609185132.1fcdab00@omt-cwnxr4tfw5-lht.ads.dlh.de>
In-Reply-To: <aignTNlK5kCLmQ2A@tom-desktop>
References: <20260513115853.1584230-1-alban.bedel@lht.dlh.de>
 <20260520152225.GH2767592@google.com>
 <aignTNlK5kCLmQ2A@tom-desktop>
Organization: Lufthansa Technik AG
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; aarch64-apple-darwin25.4.0)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[lht.dlh.de : SPF not aligned (relaxed), No valid DKIM,quarantine];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-8540-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tommaso.merciai.xr@bp.renesas.com,m:lee@kernel.org,m:linux-leds@vger.kernel.org,m:pavel@kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[alban.bedel@lht.dlh.de,linux-leds@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alban.bedel@lht.dlh.de,linux-leds@vger.kernel.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	DBL_BLOCKED_OPENRESOLVER(0.00)[omt-cwnxr4tfw5-lht.ads.dlh.de:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,renesas.com:email,vger.kernel.org:from_smtp,lht.dlh.de:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 62D56662F06

On Tue, 9 Jun 2026 16:46:36 +0200
Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com> wrote:

> Hi Lee,
> Thanks for your patch.
> 
> On Wed, May 20, 2026 at 04:22:25PM +0100, Lee Jones wrote:
> [...]
> > What happens if fwnode_property_match_string() returns an error?  
> 
> Agree.
> 
> I think we need to check index:
> 		if (index < 0)
> 			return ERR_PTR(-ENOENT);

I don't think that's the right solution. The documentation of
fwnode_property_get_reference_args() says that it return -ENOENT
when the index is out range. So it looks like the OF implementation
has a bug.

Looking at of_fwnode_get_reference_args() it directly pass the return
value of __of_parse_phandle_with_args(), which return -EINVAL when the
index is out of range. We should rather fix the OF implementation of
fwnode_property_get_reference_args() to respect the documented
interface.

Alban

