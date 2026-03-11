Return-Path: <linux-leds+bounces-7298-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YBV4Jv54sWk2vgIAu9opvQ
	(envelope-from <linux-leds+bounces-7298-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 11 Mar 2026 15:15:26 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9556626534A
	for <lists+linux-leds@lfdr.de>; Wed, 11 Mar 2026 15:15:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BD43F3040304
	for <lists+linux-leds@lfdr.de>; Wed, 11 Mar 2026 14:12:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB2D331E85D;
	Wed, 11 Mar 2026 14:11:59 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B98F331203
	for <linux-leds@vger.kernel.org>; Wed, 11 Mar 2026 14:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773238319; cv=none; b=HA5KH0ya6kMWWDDstlUlcYWTtndIKg7kThSu1IiD3DC/rISiElSi1+ackzysqd+YL7Fp1PX0BTWz1X8hH5e6j1oQ3xE2yCFk6zx1OWnXA9489EV2UW+XxCE6UM035MvvvJSFIONsWNtKQR50dETfcghYg6e002nyx7Imbul1NdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773238319; c=relaxed/simple;
	bh=POUJjzeRhBIXfPGojdZfC417KH92loTKx1KmDpRcfoc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oJIa95SH3TFhxVC7j/yREi/8bdLdNijyIMZbPldF/TvU1EwQIN1Jy+DtgQIu9s6TR+B1qVkwSdPvCqwFQJeA+UNMDfoYfzLjT/P9S6Guct0wplEVpWvMf1q+fy2aC4lZpetvLZr2cz54lxzS3XvlQ3fxT0ylJgLZ7qmWZY/e/5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b96dc65b886so179898666b.0
        for <linux-leds@vger.kernel.org>; Wed, 11 Mar 2026 07:11:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773238317; x=1773843117;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wIz9Fr5w5J45ZN4rxwvT/0kjXMGfLP1VpB2aKPOax7k=;
        b=ImmyopHDXEBB6BMhtxYXurKoJwJx5LRmVM5xGOal+O5u7glbdWAWNjdyE+oCLRWtrf
         QVeTa3+xHTbyuGRbjLmZ7qjRgYza4MTV2Ya2OIJ9/7BDUZ3uBFjplOciyPM15RXVddUX
         +bpoGvfZ/Cdob6ipcTBUljV85ib6OGcsSORF9ELWyLDFxggd+VpwpgB0GK0lPIY/Mnxr
         MgLLnDi5YSzDpQ5mA/7sWP/CfgkgXWX+5HZ0KE9TWSRv3KgljmtA9R7P0H/BMHn5mZvo
         JD3pz9jfJChP9UVZWWbo6c++0OwHT43Jv7Fh9ybgZNoSCtRKTrLXsN6eFBVewGXLmlB3
         L7XA==
X-Forwarded-Encrypted: i=1; AJvYcCVnPp+ug9DyI0dUHjJdyB+qyhMIrWDcw7i69kYPwYasc4rjT2gn4rAVELs+FV7iBxGjfGvXGv2ugOH+@vger.kernel.org
X-Gm-Message-State: AOJu0YypjvciW1aXros6ULJPRsxGHFh4Y+8xncH+nAfgIyCzmTwNXDz+
	JpCZ6SdI0W1MtYF5b8tqjo4sHFZO39K20qwZVTbJUowRoWjKldHgb0OQdf+XlpbL6pc/hw==
X-Gm-Gg: ATEYQzwxOfF+w0fVfbhJwFoaK6HvcXtQTyf+43BAjGZZMZDdI+LJsyhchtwpsX0hQD8
	ZfXX3Fb4iZq3zmPXQ3nT9oBlPF9iiC3ty2GKXLRhSarJd6GSpN56+ib49FP5V7K+xMD8v7ew0XO
	8gDic2JF0I6QG5nTD+13Jp6KZ3/vvFxkdMaMELovfj9pLXp23bTVL4O1w+FX3pn+Tp+G5OOic/q
	nPRGdpVlzBgNFijmBRWD6NVynJfyD006XxgrpWNRJYkOQ0VrqjDzJQSdZ6xgXwQQqBETpE2UqIs
	qzPy1Bvqn7eNQksNhGVTvgitLbQ9jR5qHYN6CFKpRQAGgS1YnbmxgurhdxDI6n0lDTCKCrVJd0w
	tRUY2Tuo08Ce9J3wkmGq+ftXvtxU0cVf5BBkTmvqM1RfhreA/1gtdFGJL9dJxLgyP3iZqaawGaM
	WEFoC35UTkdOzkkOiR3rrIO4ZflLvqTX8iTX0Osyocp2tMLDZIjjiieb+2eA/x
X-Received: by 2002:a17:907:9611:b0:b97:5dc:3bd9 with SMTP id a640c23a62f3a-b972d524650mr176901966b.8.1773238316630;
        Wed, 11 Mar 2026 07:11:56 -0700 (PDT)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com. [209.85.208.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b972e1be0edsm54782566b.59.2026.03.11.07.11.56
        for <linux-leds@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 07:11:56 -0700 (PDT)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-66174cf4549so2112260a12.0
        for <linux-leds@vger.kernel.org>; Wed, 11 Mar 2026 07:11:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXZAFIYR9CAc7amYsADkFsIuWNq19BLf9LD2lnVHfrJrcAcPVrU3J++s1ZHMOxEWX34TyNF7ZD5Dy1w@vger.kernel.org
X-Received: by 2002:a17:907:6d16:b0:b88:4f25:81da with SMTP id
 a640c23a62f3a-b97113ff0b9mr462021166b.0.1773237981235; Wed, 11 Mar 2026
 07:06:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de>
 <20260310-b4-is_err_or_null-v1-15-bd63b656022d@avm.de> <20260310100750.303af303@gandalf.local.home>
 <20260311141332.b611237d36b61b2409e66cb3@kernel.org> <20260311100332.6a2ce4b1@gandalf.local.home>
In-Reply-To: <20260311100332.6a2ce4b1@gandalf.local.home>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 11 Mar 2026 15:06:07 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX4kRGLaKMzPuhS1Pmxh609eiqQW-cAS_jWBBbt-vE6SA@mail.gmail.com>
X-Gm-Features: AaiRm53WEGMMLW4z34e7P-lM1qFvsCJGZ_o4JNL5NPWbhJPKmcqz6k9bJcyL--8
Message-ID: <CAMuHMdX4kRGLaKMzPuhS1Pmxh609eiqQW-cAS_jWBBbt-vE6SA@mail.gmail.com>
Subject: Re: [PATCH 15/61] trace: Prefer IS_ERR_OR_NULL over manual NULL check
To: Steven Rostedt <rostedt@goodmis.org>
Cc: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Philipp Hahn <phahn-oss@avm.de>, amd-gfx@lists.freedesktop.org, 
	apparmor@lists.ubuntu.com, bpf@vger.kernel.org, ceph-devel@vger.kernel.org, 
	cocci@inria.fr, dm-devel@lists.linux.dev, dri-devel@lists.freedesktop.org, 
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
	v9fs@lists.linux.dev, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 9556626534A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7298-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-leds@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_GT_50(0.00)[57];
	R_DKIM_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,goodmis.org:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Action: no action

Hi Steven,

On Wed, 11 Mar 2026 at 15:03, Steven Rostedt <rostedt@goodmis.org> wrote:
> On Wed, 11 Mar 2026 14:13:32 +0900
> Masami Hiramatsu (Google) <mhiramat@kernel.org> wrote:
>
> > Hmm, now IS_ERR_OR_NULL() is an inline function, so it is safe.
> > But if you want to use IS_ERR_OR_NULL() here, it will be better something like
> >
> > node = rhashtable_walk_next(&iter);
> > while (!IS_ERR_OR_NULL(node)) {
> >       fprobe_remove_node_in_module(mod, node, &alist);
> >       node = rhashtable_walk_next(&iter);
> > }
>
> But now you need to have a duplicate code in order to acquire "node"
>
> I think the patch just makes the code worse.

Obviously we need a new for_each_*() helper hiding all the gory internals?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

