Return-Path: <linux-leds+bounces-7048-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uEjPAhPtoWlDxQQAu9opvQ
	(envelope-from <linux-leds+bounces-7048-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 27 Feb 2026 20:14:27 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 81CF71BC87E
	for <lists+linux-leds@lfdr.de>; Fri, 27 Feb 2026 20:14:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 67939319DFA4
	for <lists+linux-leds@lfdr.de>; Fri, 27 Feb 2026 19:09:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AC94393DF4;
	Fri, 27 Feb 2026 19:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="v9GDKfbK"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13FAA3859CB;
	Fri, 27 Feb 2026 19:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772219354; cv=none; b=iFdQ62TmIIcrkW0ouoJPGpJMkO3TSBmjSC6XajiVYs6r4r6sl7yGG7l7KXq5ddN5E6N8zhdhoC7TvDpe+/E4pUaG3QdovNaJfLrzKGAL/P9tvjKB2+ICmu+03E7tsJKa+Q8lwi/Ghl7mhKZo5URsX0pXvCY4eYdtNrYDD/3w01Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772219354; c=relaxed/simple;
	bh=D9Dez1DpIdZx5d3CPZh/vD0rwfn3cer5kJkfvXaBqQc=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=OR8K8pKPkdfeoDpI/40OKBVG1NOC0vh4eH76wDBdyyPmUL6D1jSSjdRYYN1k354UEw6ll80tYTCXzg41h+2e4UQmZb9W19aGGxOhxoo3d2ma4ZRCvbhSwHZ4ZYjJZ4fLx4HZqoUW+Dfz6LQ53fwdJZpZ4fqGFoFrwqg+BSvOqMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=v9GDKfbK; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1772219351; x=1772824151; i=markus.elfring@web.de;
	bh=E6Ta+FHby0/5FaAJCH39Lgkr/1Dlo/eysdDHn9aouoU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=v9GDKfbK7hFGTOD2GKDqa9N6axTx20xVFX5t7RVk1C/mw0+CgR1wVJzBhzyf5rre
	 ppvt6AYEK5KU5qYeBiZ3pK4POT5D5YjVxMExpfpMhhs/bi42nwOvCBn2oqZt01zVQ
	 HYIFCUIvIWdcD1jPaaGK/dDETBK0rFx4tCV6LRWjrQPltcwxHaaxzps4IGq1ycQsX
	 P9HuoAkCvpUrnyVG0RWgbct/Kd3UxuJUqFVORx79yrSI/c6gvDBZuKRqKqRWKDcBx
	 7npwRAOEFDluxb6F2G0U3y5VhpNcG7G7sauUFukXS0zJlqnTnww8kHLOwbUrHjKms
	 l3fcGMw0zvxFNw9U0w==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MEUW8-1vuNBs3Eba-00C1cx; Fri, 27
 Feb 2026 20:09:10 +0100
Message-ID: <12de09d0-e321-4ab1-9dec-89d781d05d8b@web.de>
Date: Fri, 27 Feb 2026 20:09:08 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chen Ni <nichen@iscas.ac.cn>, linux-leds@vger.kernel.org,
 Pavel Machek <pavel@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Bartosz Golaszewski <brgl@kernel.org>, Lee Jones <lee@kernel.org>,
 Linus Walleij <linusw@kernel.org>
References: <20260226033048.3715915-1-nichen@iscas.ac.cn>
Subject: Re: [PATCH] leds: lgm-sso: Remove duplicate assignments for
 priv->mmap
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260226033048.3715915-1-nichen@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:Nd759Y3R/nPUyFHkGJIcO0cILJj846FYOhc+i/1vR/aEi3qnoGe
 eakjpMN9MtPNfEnNzoMjDmMQT55GUdlDQgW5pBYAwQEuvHY9ErgRPOzPMam3/RnQGzcuXl2
 NfV58IZPrpsJrkVy+AGFOFZiVlXbtnF22oibECBWmB5UU4pk4ija2YVe6+NqpJZB5PEf5FV
 v+IOVE9qTrisS6hvQCSvQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:RTXazj5o9kM=;hNt1zyrhq3xQNddAJe8nz6S0Py+
 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
 1vbMjdKw=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[web.de,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[web.de:s=s29768273];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7048-lists,linux-leds=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[web.de:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[web.de];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Markus.Elfring@web.de,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 81CF71BC87E
X-Rspamd-Action: no action

> Remove duplicate assignments for priv->mmap in intel_sso_led_probe().

                   assignment?


See also once more:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/stable-kernel-rules.rst?h=v7.0-rc1#n34

Regards,
Markus

