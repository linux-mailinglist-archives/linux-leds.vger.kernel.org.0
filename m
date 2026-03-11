Return-Path: <linux-leds+bounces-7296-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UOrXJPlssWlVvAIAu9opvQ
	(envelope-from <linux-leds+bounces-7296-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 11 Mar 2026 14:24:09 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id ED60C2646E2
	for <lists+linux-leds@lfdr.de>; Wed, 11 Mar 2026 14:24:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4AD84302CB02
	for <lists+linux-leds@lfdr.de>; Wed, 11 Mar 2026 13:23:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7119431AAAF;
	Wed, 11 Mar 2026 13:23:18 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD5731E846
	for <linux-leds@vger.kernel.org>; Wed, 11 Mar 2026 13:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773235398; cv=none; b=VG+cgKXRxj2LYcUbO1fgEuPHT7JYlwA7CZiW3ZGSoSzXKH8MKvOw2kcYFDFUKzXbXo9FgSV5FL+dLVqtbsDGAlGwJOYeriZxFonD5pBh451ofAP2GXcPgfe79g8k6N7MPCEjHnepNedcLV/0qxcMXhkh8g88+Jx0COMILuF4tyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773235398; c=relaxed/simple;
	bh=bQRlE5OR+3/41N9B/xBGXfMeOTv3hgeQ2WrY6jcTpBY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rjg0cMJrfljEQkzyio+4NYKgs9fVKlu9UnDSGO6dcByDLR1B+y1LrHIfB+GxfP7DS5zymUaQc63GW1i8XioBAXTJhSlgmEC8ZTXyd6p6JYHp4NUqFGn3Zkex3YqutbZUz4/O/pZbTiLFCakdh/sK5wcKUqa9AoS2LLEVfVEjzb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-56739adfa1aso10530050e0c.0
        for <linux-leds@vger.kernel.org>; Wed, 11 Mar 2026 06:23:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773235396; x=1773840196;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=34DR94e/1PAvLLEaib58vFA4GW0m5SGe6jvxchEhMek=;
        b=xIjGI8KoWlfM45h8oOp5436CPqdRIOfoMg98aTer9it/0ngsQMdL7b3oYCdBXp9bK7
         8rXvJAuf84rHdp0A8NcVt+mTVl+6Y7F+mt35/P19ZrtaSoYXi4IMc3DctemnKZg8xQCu
         PiqEg6dg2siyVkXJWWLEWykuRl7/tD8JIh2IbR5I63rbr/VN0RaZbTlJlMh1jt/Rgf6F
         1r5xspyb/F6g5qvQYr9jZyCgHbj+EO+SrOSua1XGFCg6xizGlok5f7qI6smTKdx1sPCQ
         iCncweLCwYzIi5bmTVjlg2B+YhXQal9o26EaFseaqg23szpVC4m6j2ME4qh095yOrjFu
         lqsQ==
X-Forwarded-Encrypted: i=1; AJvYcCU66KhKR2Ls/DsELR38oNpYEzkmd0Xj0jWlnv+UbDSFj567CmcOu2Zs1X9N7Ft3wgdUBdcMSFF0hxXb@vger.kernel.org
X-Gm-Message-State: AOJu0YyLHdzuKaBMIUAHlWrq4UAqIvnols5usVKZkI5fIOyBKzzwr6bu
	8An1froF2xaG13LRtL95AMmUqtxiBBYmtEZkZVPO+sYDOEjZT8/xHqodesGqGAHrH5A=
X-Gm-Gg: ATEYQzyFAl06Ya9AqYq5b+Z/fgi/ZjwD5xD5TTlOZsLQ2fFr5P+nd7FSGW6myQUckjG
	hpDO43isWlZcjqSSD+CK9zkfKelGK57+UikeEKKBWYZbRwfnQJD33dMtoatYdfExQMjR7T9mRpn
	oIE6HmclSPZhrDPGJ7csYL2qO2N1KigzKnvNlExiL2AmXgmsTXhCGH53KwHV+D315macH+wP2h3
	7OECxiwgoBhPz90y5qNgzD2hPY5SU0kQmgWvOrpgXRjmBN51MRE70si11YXv0tfGstysXYL85QL
	aWVb9a54S7s2SNSGdjG8TMkje5G+brFNzwx/Aa0hiWaiIRyrrsULSL91uNs6p0BtK8+ppga1LAd
	mOplEalttfDhlbYUY6Uw6B43no/5vyhl5wZowYjWjw7qUphScqtftBZo5F9Lor9UVLNnTxHDvmV
	ob1IR7HF366oOC9m5j03qQtYzO+E8gHkc6FOS8SOfm6I2QrySNxmvAFyhLhB/6+TFemlIbj30=
X-Received: by 2002:a05:6122:3487:b0:56a:92d8:785a with SMTP id 71dfb90a1353d-56b4754f8femr989931e0c.15.1773235395962;
        Wed, 11 Mar 2026 06:23:15 -0700 (PDT)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56b4646bdfasm934965e0c.13.2026.03.11.06.23.15
        for <linux-leds@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 06:23:15 -0700 (PDT)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-94de88e52e5so8500358241.0
        for <linux-leds@vger.kernel.org>; Wed, 11 Mar 2026 06:23:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW90NNSMqqv1rDKQg7JpGbyeOkOavpbXp8e2G9ZRklz3sKnoUclKDQKeCXyCM88J1xspyUVcyBAU+99@vger.kernel.org
X-Received: by 2002:a05:6122:1d05:b0:55b:7494:177b with SMTP id
 71dfb90a1353d-56b4752d806mr922396e0c.10.1773234967338; Wed, 11 Mar 2026
 06:16:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de> <20260310-b4-is_err_or_null-v1-36-bd63b656022d@avm.de>
In-Reply-To: <20260310-b4-is_err_or_null-v1-36-bd63b656022d@avm.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 11 Mar 2026 14:15:56 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXQ8Q4jvkgFRJYhghz2BZRDC-9Mk6DbXxuaOc6C9DFHZQ@mail.gmail.com>
X-Gm-Features: AaiRm52J84H77ROK64ZWWtJfaiCpnFeKyoSRmPbi-NC8CN6Ju1TJEFxJU9gZQQ8
Message-ID: <CAMuHMdXQ8Q4jvkgFRJYhghz2BZRDC-9Mk6DbXxuaOc6C9DFHZQ@mail.gmail.com>
Subject: Re: [PATCH 36/61] arch/sh: Prefer IS_ERR_OR_NULL over manual NULL check
To: Philipp Hahn <phahn-oss@avm.de>
Cc: amd-gfx@lists.freedesktop.org, apparmor@lists.ubuntu.com, 
	bpf@vger.kernel.org, ceph-devel@vger.kernel.org, cocci@inria.fr, 
	dm-devel@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	gfs2@lists.linux.dev, intel-gfx@lists.freedesktop.org, 
	intel-wired-lan@lists.osuosl.org, iommu@lists.linux.dev, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-block@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, linux-btrfs@vger.kernel.org, 
	linux-cifs@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-hyperv@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-mips@vger.kernel.org, linux-mm@kvack.org, 
	linux-modules@vger.kernel.org, linux-mtd@lists.infradead.org, 
	linux-nfs@vger.kernel.org, linux-omap@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-pm@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-scsi@vger.kernel.org, linux-sctp@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-trace-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-wireless@vger.kernel.org, netdev@vger.kernel.org, ntfs3@lists.linux.dev, 
	samba-technical@lists.samba.org, sched-ext@lists.linux.dev, 
	target-devel@vger.kernel.org, tipc-discussion@lists.sourceforge.net, 
	v9fs@lists.linux.dev, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: ED60C2646E2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7296-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-leds@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_GT_50(0.00)[57];
	R_DKIM_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fu-berlin.de:email,glider.be:email,mail.gmail.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,avm.de:email,linux-m68k.org:email]
X-Rspamd-Action: no action

On Tue, 10 Mar 2026 at 12:56, Philipp Hahn <phahn-oss@avm.de> wrote:
> Prefer using IS_ERR_OR_NULL() over using IS_ERR() and a manual NULL
> check.
>
> Change generated with coccinelle.
>
> To: Yoshinori Sato <ysato@users.sourceforge.jp>
> To: Rich Felker <dalias@libc.org>
> To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> Cc: linux-sh@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Philipp Hahn <phahn-oss@avm.de>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

