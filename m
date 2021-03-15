Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7B2733C1E7
	for <lists+linux-leds@lfdr.de>; Mon, 15 Mar 2021 17:32:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233845AbhCOQcC (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 15 Mar 2021 12:32:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59645 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233600AbhCOQby (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Mon, 15 Mar 2021 12:31:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1615825913;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=lPHTIHZ4eFEhzbf8Lue71aAKURfHh1P+gutymQ7cPuQ=;
        b=A3+Ztm7/VALzhpf2xDJ+ksc9Vgj4kzUtCU5yLMi0AFdYZVmun8s18qXFVvNz2VG2Wn7pa6
        iTQZ1yQCPtH1hbh/mjI56T9V1JwL9Fiqr3hLDkt0HNRLTTwFhGkT9qQR+2mFjErwELOA4b
        z5QHP2URFjh0jEdSIULgFUXz9C2X5Y0=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467-4hAuCJk_M5qJO7SMrZDodA-1; Mon, 15 Mar 2021 12:31:51 -0400
X-MC-Unique: 4hAuCJk_M5qJO7SMrZDodA-1
Received: by mail-ed1-f70.google.com with SMTP id i19so16298253edy.18
        for <linux-leds@vger.kernel.org>; Mon, 15 Mar 2021 09:31:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lPHTIHZ4eFEhzbf8Lue71aAKURfHh1P+gutymQ7cPuQ=;
        b=lm/mz6SLEOSUDfxTmmUlwqNDIjTHDfrBvOBx9I3Pc/rKg2l1zA5JIDoq86Ml6vWuuS
         zZyxdLCle4dXLbgItVmeNpyNNrnGRgDnfN95d8kStEImRZYhaLk9GT67khMLomw/jjOL
         15MSlkP9SR2+j4/v1UfsdVVGkuxAz67t1SWgW0eoMkkCXnMKpi3Cwvv7pHqFdagjnT6W
         +KKxxUJHePYhpmaqVu7EjS+INiSam/d1iRa95MjCU5gjiVKCZfOCNAqzjEgG09w6YKBQ
         o+GIYG/9kF7u9T9yB1E01uZcFUdWJM2VRE5ue2hMhGKvzO/g6CNH2dI2lpARF+Easxnh
         QBog==
X-Gm-Message-State: AOAM531NQJPsso4lzcGeF1BqlX+tJnTtsB3KyqhLO+Wom/HU5UZrzV/n
        F02frpn7NEDv0wZZoHtTs4QiqrxD50SQPIMh8grqZ3rNSvjDE3ValBg1Agg+tKu/wjnLI1JTjW9
        oE2K4PDQaIwaGpBo2sKE9NA==
X-Received: by 2002:a17:906:2dda:: with SMTP id h26mr24314467eji.163.1615825910689;
        Mon, 15 Mar 2021 09:31:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyoY00PBixaBAq+e0MuGm3mxB4Ev2NqXWIQw0ejZ1fznG1bZlq2PV+RT10l48AjX9urbitjGQ==
X-Received: by 2002:a17:906:2dda:: with SMTP id h26mr24314448eji.163.1615825910517;
        Mon, 15 Mar 2021 09:31:50 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id lu26sm7538546ejb.33.2021.03.15.09.31.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Mar 2021 09:31:50 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: pmc_atom: use callback for all dmi quirk
 entries
To:     Henning Schild <henning.schild@siemens.com>,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-watchdog@vger.kernel.org
Cc:     Srikanth Krishnakar <skrishnakar@gmail.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        Gerd Haeussler <gerd.haeussler.ext@siemens.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Mark Gross <mgross@linux.intel.com>,
        Pavel Machek <pavel@ucw.cz>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
References: <ef5fe493-285d-145c-8d05-7f9bd0cb47c5@redhat.com>
 <20210315145855.17174-1-henning.schild@siemens.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <8577f3a8-c5e4-3752-1bc1-5937ee164217@redhat.com>
Date:   Mon, 15 Mar 2021 17:31:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210315145855.17174-1-henning.schild@siemens.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,

On 3/15/21 3:58 PM, Henning Schild wrote:
> Introduce a global variable to remember the matching entry for later
> printing. Also having a callback allows to stop matching after the first
> hit.
> 
> Signed-off-by: Henning Schild <henning.schild@siemens.com>
> ---
>  drivers/platform/x86/pmc_atom.c | 26 ++++++++++++++++++++------
>  1 file changed, 20 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/platform/x86/pmc_atom.c b/drivers/platform/x86/pmc_atom.c
> index 38542d547f29..d0f74856cd8b 100644
> --- a/drivers/platform/x86/pmc_atom.c
> +++ b/drivers/platform/x86/pmc_atom.c
> @@ -364,8 +364,16 @@ static void pmc_dbgfs_register(struct pmc_dev *pmc)
>  #endif /* CONFIG_DEBUG_FS */
>  
>  static bool pmc_clk_is_critical = true;
> +static const struct dmi_system_id *dmi_critical;
>  
> -static int siemens_clk_is_critical(const struct dmi_system_id *d)
> +static int dmi_callback(const struct dmi_system_id *d)
> +{
> +	dmi_critical = d;

Don't introduce a global variable for this please. Instead just directly
print the ident of the matching dmi_system_id here.

Regards,

Hans


> +
> +	return 1;
> +}
> +
> +static int dmi_callback_siemens(const struct dmi_system_id *d)
>  {
>  	u32 st_id;
>  
> @@ -373,7 +381,7 @@ static int siemens_clk_is_critical(const struct dmi_system_id *d)
>  		goto out;
>  
>  	if (st_id == SIMATIC_IPC_IPC227E || st_id == SIMATIC_IPC_IPC277E)
> -		return 1;
> +		return dmi_callback(d);
>  
>  out:
>  	pmc_clk_is_critical = false;
> @@ -388,6 +396,7 @@ static const struct dmi_system_id critclk_systems[] = {
>  	{
>  		/* pmc_plt_clk0 is used for an external HSIC USB HUB */
>  		.ident = "MPL CEC1x",
> +		.callback = dmi_callback,
>  		.matches = {
>  			DMI_MATCH(DMI_SYS_VENDOR, "MPL AG"),
>  			DMI_MATCH(DMI_PRODUCT_NAME, "CEC10 Family"),
> @@ -396,6 +405,7 @@ static const struct dmi_system_id critclk_systems[] = {
>  	{
>  		/* pmc_plt_clk0 - 3 are used for the 4 ethernet controllers */
>  		.ident = "Lex 3I380D",
> +		.callback = dmi_callback,
>  		.matches = {
>  			DMI_MATCH(DMI_SYS_VENDOR, "Lex BayTrail"),
>  			DMI_MATCH(DMI_PRODUCT_NAME, "3I380D"),
> @@ -404,6 +414,7 @@ static const struct dmi_system_id critclk_systems[] = {
>  	{
>  		/* pmc_plt_clk* - are used for ethernet controllers */
>  		.ident = "Lex 2I385SW",
> +		.callback = dmi_callback,
>  		.matches = {
>  			DMI_MATCH(DMI_SYS_VENDOR, "Lex BayTrail"),
>  			DMI_MATCH(DMI_PRODUCT_NAME, "2I385SW"),
> @@ -412,6 +423,7 @@ static const struct dmi_system_id critclk_systems[] = {
>  	{
>  		/* pmc_plt_clk* - are used for ethernet controllers */
>  		.ident = "Beckhoff CB3163",
> +		.callback = dmi_callback,
>  		.matches = {
>  			DMI_MATCH(DMI_SYS_VENDOR, "Beckhoff Automation"),
>  			DMI_MATCH(DMI_BOARD_NAME, "CB3163"),
> @@ -420,6 +432,7 @@ static const struct dmi_system_id critclk_systems[] = {
>  	{
>  		/* pmc_plt_clk* - are used for ethernet controllers */
>  		.ident = "Beckhoff CB4063",
> +		.callback = dmi_callback,
>  		.matches = {
>  			DMI_MATCH(DMI_SYS_VENDOR, "Beckhoff Automation"),
>  			DMI_MATCH(DMI_BOARD_NAME, "CB4063"),
> @@ -428,6 +441,7 @@ static const struct dmi_system_id critclk_systems[] = {
>  	{
>  		/* pmc_plt_clk* - are used for ethernet controllers */
>  		.ident = "Beckhoff CB6263",
> +		.callback = dmi_callback,
>  		.matches = {
>  			DMI_MATCH(DMI_SYS_VENDOR, "Beckhoff Automation"),
>  			DMI_MATCH(DMI_BOARD_NAME, "CB6263"),
> @@ -436,13 +450,14 @@ static const struct dmi_system_id critclk_systems[] = {
>  	{
>  		/* pmc_plt_clk* - are used for ethernet controllers */
>  		.ident = "Beckhoff CB6363",
> +		.callback = dmi_callback,
>  		.matches = {
>  			DMI_MATCH(DMI_SYS_VENDOR, "Beckhoff Automation"),
>  			DMI_MATCH(DMI_BOARD_NAME, "CB6363"),
>  		},
>  	},
>  	{
> -		.callback = siemens_clk_is_critical,
> +		.callback = dmi_callback_siemens,
>  		.ident = "SIEMENS AG",
>  		.matches = {
>  			DMI_MATCH(DMI_SYS_VENDOR, "SIEMENS AG"),
> @@ -457,7 +472,6 @@ static int pmc_setup_clks(struct pci_dev *pdev, void __iomem *pmc_regmap,
>  {
>  	struct platform_device *clkdev;
>  	struct pmc_clk_data *clk_data;
> -	const struct dmi_system_id *d;
>  
>  	clk_data = kzalloc(sizeof(*clk_data), GFP_KERNEL);
>  	if (!clk_data)
> @@ -468,8 +482,8 @@ static int pmc_setup_clks(struct pci_dev *pdev, void __iomem *pmc_regmap,
>  	if (dmi_check_system(critclk_systems)) {
>  		clk_data->critical = pmc_clk_is_critical;
>  		if (clk_data->critical) {
> -			d = dmi_first_match(critclk_systems);
> -			pr_info("%s critclks quirk enabled\n", d->ident);
> +			pr_info("%s critclks quirk enabled\n",
> +				dmi_critical->ident);
>  		}
>  	}
>  
> 

