Return-Path: <linux-leds+bounces-1302-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D8560886FC7
	for <lists+linux-leds@lfdr.de>; Fri, 22 Mar 2024 16:25:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 087E51C21C38
	for <lists+linux-leds@lfdr.de>; Fri, 22 Mar 2024 15:25:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E0944D137;
	Fri, 22 Mar 2024 15:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="xtmDNovo"
X-Original-To: linux-leds@vger.kernel.org
Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C55453E2B
	for <linux-leds@vger.kernel.org>; Fri, 22 Mar 2024 15:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711121110; cv=none; b=kNivRaUM2h0hpxD2XwUtGIwmc/YWMDdu+h/Z5tkWBtnNW1AmHkrSCcncCXLUYpAwKjRBYf42OMkswJhB6wwBqtvBYmtt0Evkm8EAPLfCttFZwwOUXIRhWgeXtArAWiK2XaxpLgefPpzADzykxg53Uxr8XMkOYBF5aTJIh+BwYuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711121110; c=relaxed/simple;
	bh=2wLtvbfdZn3x4UVXEGhEhJpxbE8sclowteClLq1fG3c=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=UjSifyIZolxgzvsnVEM8fAPf0tosh7u6HVhC7AzJYQQcivZfuC/BwYJcvdFAiUBcfA707wCKJ8vBoNXxJb94kl2OOXAG+qq9MEHoW1+J4WEA+SJ8cuISVcBH6BaiGfxKo88y6h8zxdXluwQF2GPtNf6ojt3EDqiByfbkpy6mKHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=xtmDNovo; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <b818a791-25df-4902-8999-5829dcfd528c@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1711121106;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6Mwt+clMmeFlynCqWeYgsMgQsu2kallWPr96FGjiq3o=;
	b=xtmDNovo201g+m95MB0sDImmNbElEi6TQzc0YiBIQHQESsZtiGpoNmR0PzChrSRolbmahQ
	+19KrAQ6hPmRFRd7p7c/WHFbrKV+z5kkUNWdALtfQbxZRDjUn1RyqlEvFiBQmTnoKRy4av
	0vHv1gP4ngStgN9OcENG/gj1UE7YV5M=
Date: Fri, 22 Mar 2024 08:24:59 -0700
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] leds: trigger: legtrig-bpf: Add ledtrig-bpf module
Content-Language: en-GB
To: Daniel Hodges <hodges.daniel.scott@gmail.com>, ast@kernel.org,
 pavel@ucw.cz, lee@kernel.org, linux-leds@vger.kernel.org,
 daniel@iogearbox.net, bpf@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1711113657.git.hodges.daniel.scott@gmail.com>
 <ac8e77881212e18d117059a698affd6afc2607af.1711113657.git.hodges.daniel.scott@gmail.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yonghong Song <yonghong.song@linux.dev>
In-Reply-To: <ac8e77881212e18d117059a698affd6afc2607af.1711113657.git.hodges.daniel.scott@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


On 3/22/24 7:08 AM, Daniel Hodges wrote:
> This patch adds a led trigger that interfaces with the bpf subsystem. It
> allows for BPF programs to control LED activity through calling bpf
> kfuncs. This functionality is useful in giving users a physical
> indication that a BPF program has performed an operation such as
> handling a packet or probe point.
>
> Signed-off-by: Daniel Hodges <hodges.daniel.scott@gmail.com>
> ---
>   drivers/leds/trigger/Kconfig       | 10 +++++
>   drivers/leds/trigger/Makefile      |  1 +
>   drivers/leds/trigger/ledtrig-bpf.c | 72 ++++++++++++++++++++++++++++++
>   3 files changed, 83 insertions(+)
>   create mode 100644 drivers/leds/trigger/ledtrig-bpf.c
>
> diff --git a/drivers/leds/trigger/Kconfig b/drivers/leds/trigger/Kconfig
> index d11d80176fc0..30b0fd3847be 100644
> --- a/drivers/leds/trigger/Kconfig
> +++ b/drivers/leds/trigger/Kconfig
> @@ -152,4 +152,14 @@ config LEDS_TRIGGER_TTY
>   
>   	  When build as a module this driver will be called ledtrig-tty.
>   
> +config LEDS_TRIGGER_BPF
> +	tristate "LED BPF Trigger"
> +	depends on BPF
> +	depends on BPF_SYSCALL
> +	help
> +	  This allows LEDs to be controlled by the BPF subsystem. This trigger
> +	  must be used with a loaded BPF program in order to control LED state.
> +	  BPF programs can control LED state with kfuncs.
> +	  If unsure, say N.
> +
>   endif # LEDS_TRIGGERS
> diff --git a/drivers/leds/trigger/Makefile b/drivers/leds/trigger/Makefile
> index 25c4db97cdd4..ac47128d406c 100644
> --- a/drivers/leds/trigger/Makefile
> +++ b/drivers/leds/trigger/Makefile
> @@ -16,3 +16,4 @@ obj-$(CONFIG_LEDS_TRIGGER_NETDEV)	+= ledtrig-netdev.o
>   obj-$(CONFIG_LEDS_TRIGGER_PATTERN)	+= ledtrig-pattern.o
>   obj-$(CONFIG_LEDS_TRIGGER_AUDIO)	+= ledtrig-audio.o
>   obj-$(CONFIG_LEDS_TRIGGER_TTY)		+= ledtrig-tty.o
> +obj-$(CONFIG_LEDS_TRIGGER_BPF)		+= ledtrig-bpf.o
> diff --git a/drivers/leds/trigger/ledtrig-bpf.c b/drivers/leds/trigger/ledtrig-bpf.c
> new file mode 100644
> index 000000000000..e3b0b8281b70
> --- /dev/null
> +++ b/drivers/leds/trigger/ledtrig-bpf.c
> @@ -0,0 +1,72 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * LED BPF Trigger
> + *
> + * Author: Daniel Hodges <hodges.daniel.scott@gmail.com>
> + */
> +
> +#include <linux/bpf.h>
> +#include <linux/btf.h>
> +#include <linux/btf_ids.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/init.h>
> +#include <linux/leds.h>
> +
> +
> +DEFINE_LED_TRIGGER(ledtrig_bpf);
> +
> +__bpf_hook_start()
> +
> +__bpf_kfunc void bpf_ledtrig_blink(unsigned long delay_on, unsigned long delay_off, int invert)
> +{
> +	led_trigger_blink_oneshot(ledtrig_bpf, delay_on, delay_off, invert);
> +}
> +__bpf_hook_end();
> +
> +BTF_SET8_START(ledtrig_bpf_kfunc_ids)
> +BTF_ID_FLAGS(func, bpf_ledtrig_blink)
> +BTF_SET8_END(ledtrig_bpf_kfunc_ids)
> +
> +static const struct btf_kfunc_id_set ledtrig_bpf_kfunc_set = {
> +	.owner = THIS_MODULE,
> +	.set   = &ledtrig_bpf_kfunc_ids,
> +};
> +
> +static int init_bpf(void)
> +{
> +	int ret;
> +
> +	ret = register_btf_kfunc_id_set(BPF_PROG_TYPE_UNSPEC,
> +			&ledtrig_bpf_kfunc_set);

If you add the kfunc to BPF_PROG_TYPE_UNSPEC, then
you do not need to add to the following prog types
since the kernel will search BPF_PROG_TYPE_UNSPEC
for all prog types.

But if the kfunc only intends to be used for the following
program types, I suggest removing the above BPF_PROG_TYPE_UNSPEC
registration.

> +	ret = register_btf_kfunc_id_set(BPF_PROG_TYPE_TRACING,
> +			&ledtrig_bpf_kfunc_set);
> +	ret = ret ?: register_btf_kfunc_id_set(BPF_PROG_TYPE_SYSCALL,
> +			&ledtrig_bpf_kfunc_set);
> +	ret = ret ?: register_btf_kfunc_id_set(BPF_PROG_TYPE_SK_SKB,
> +			&ledtrig_bpf_kfunc_set);
> +	ret = ret ?: register_btf_kfunc_id_set(BPF_PROG_TYPE_SCHED_CLS,
> +			&ledtrig_bpf_kfunc_set);
> +	ret = ret ?: register_btf_kfunc_id_set(BPF_PROG_TYPE_SCHED_ACT,
> +			&ledtrig_bpf_kfunc_set);
> +	return ret;
> +}
> +
> +static int ledtrig_bpf_init(void)
> +{
> +	led_trigger_register_simple("bpf", &ledtrig_bpf);
> +
> +	return init_bpf();
> +}
> +
> +static void __exit ledtrig_bpf_exit(void)
> +{
> +	led_trigger_unregister_simple(ledtrig_bpf);
> +}
> +
> +module_init(ledtrig_bpf_init);
> +module_exit(ledtrig_bpf_exit);
> +
> +MODULE_AUTHOR("Daniel Hodges <hodges.daniel.scott@gmail.com>");
> +MODULE_DESCRIPTION("BPF LED trigger");
> +MODULE_LICENSE("GPL v2");

