Return-Path: <linux-leds+bounces-6761-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EMS4GCIMd2lCbQEAu9opvQ
	(envelope-from <linux-leds+bounces-6761-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 26 Jan 2026 07:39:30 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A348495F
	for <lists+linux-leds@lfdr.de>; Mon, 26 Jan 2026 07:39:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4E5BA300335E
	for <lists+linux-leds@lfdr.de>; Mon, 26 Jan 2026 06:39:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4178281532;
	Mon, 26 Jan 2026 06:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q9/aN4bK"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D6327F75C;
	Mon, 26 Jan 2026 06:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769409566; cv=none; b=RSkBmx563wYnoEq9EH9tLbVROxdLPM/JrtNlqQUfDL48mYZJcV+8cIzraxLWjYGFbBv2KFxt1LAulyyFHJNV/YD3Ic7OAil9rkokWpzN/N37oNDBOuSlGIlzGNuZkNkK9zYAu238AoGBQmdiflbcOXYzIi8UnP8nwjANhTJXbD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769409566; c=relaxed/simple;
	bh=Ozq3rhl/4iBmgWrbD3sMw4Z4ZrAfKTqvMwv611o48Ag=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KNlLShKVv27dR2XECWvGQ7hYfyFFDvP0LhQMXh5bEZkysMLtAROD/dm2laT4IXgaVR7kQfs/lrCvnSybUzQM1E+zyjxi7l6sJiJ2zMCZ21pGpk1G/aMzKqNDSSh2fPsWQx0EEYCfw1X4ij2RB2iIKGs7RjmYBI2ueDfA0SCviyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q9/aN4bK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50C37C19421;
	Mon, 26 Jan 2026 06:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769409566;
	bh=Ozq3rhl/4iBmgWrbD3sMw4Z4ZrAfKTqvMwv611o48Ag=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Q9/aN4bK1dEyIM0GKFjk1KC8fmlWK7Evbol/b8phPKg9RpYg3sJO9Q7COu9QxG8NR
	 h+ena9Q9Fg6niI8Pms55mam8N2YyUPfEgt8Sho848SIQi26sUauOoK8/uJpEeUGqP/
	 XBuP2Toy+y57l3qoKtmq/ykeAiM1W095OSbokaug3pO0vLXa4f6azSaz4bn0Q0V+RT
	 +dGaUQm5zb7TiRQhz9+UGithmg8F5uKgoqsHIj9u1MEmsBqiKkoqhNreLYAAzO5gBD
	 p54QobuF8D7NhBlsSgyFuW/jsS3Qs/wpaJRVKndLgnTi81JcPJg3/vQ8LZINM+ZE5G
	 7PehOXm3bhGBg==
Message-ID: <62bbfb0e-20bd-47f7-ada1-7f4d30c888d7@kernel.org>
Date: Mon, 26 Jan 2026 15:34:25 +0900
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 4/4] leds: add disk trigger for each ata port
To: Markus Probst <markus.probst@posteo.de>, Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Niklas Cassel <cassel@kernel.org>, John Garry <john.g.garry@oracle.com>,
 Jason Yan <yanaijie@huawei.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-scsi@vger.kernel.org
References: <20260123-ledtrig_disk_-v1-0-07004756467b@posteo.de>
 <20260123-ledtrig_disk_-v1-4-07004756467b@posteo.de>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20260123-ledtrig_disk_-v1-4-07004756467b@posteo.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6761-lists,linux-leds=lfdr.de];
	FREEMAIL_TO(0.00)[posteo.de,kernel.org,gmail.com,oracle.com,huawei.com,HansenPartnership.com];
	HAS_ORG_HEADER(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dlemoal@kernel.org,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[posteo.de:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E7A348495F
X-Rspamd-Action: no action

On 1/24/26 4:05 AM, Markus Probst wrote:
> Register a disk trigger for each ata port. This trigger will only show
> the activity for the ata port it has been registered for.
> 
> This allows individual leds to be mapped to one ata port.
> This is especially useful for NAS devices, which have an own led for each
> disk slot.
> 
> Signed-off-by: Markus Probst <markus.probst@posteo.de>
> ---
>  drivers/ata/libata-core.c           |  22 +++++-
>  drivers/leds/trigger/ledtrig-disk.c | 144 ++++++++++++++++++++++++++++++------
>  drivers/scsi/libsas/sas_ata.c       |   3 +-
>  include/linux/leds.h                |  16 +++-
>  include/linux/libata.h              |   6 +-
>  5 files changed, 161 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/ata/libata-core.c b/drivers/ata/libata-core.c
> index 09d8c035fcdf..796c46449298 100644
> --- a/drivers/ata/libata-core.c
> +++ b/drivers/ata/libata-core.c
> @@ -4921,8 +4921,10 @@ void ata_qc_complete(struct ata_queued_cmd *qc)
>  	struct ata_device *dev = qc->dev;
>  	struct ata_eh_info *ehi = &dev->link->eh_info;
>  
> +#ifdef CONFIG_LEDS_TRIGGER_DISK
>  	/* Trigger the LED (if available) */
> -	ledtrig_disk_activity(!!(qc->tf.flags & ATA_TFLAG_WRITE));
> +	ledtrig_disk_activity(ap->led_trigger, !!(qc->tf.flags & ATA_TFLAG_WRITE));
> +#endif

Please define an empty wrapper for the !CONFIG_LEDS_TRIGGER_DISK case to avoid
adding this ifdef.

>  
>  	/*
>  	 * In order to synchronize EH with the regular execution path, a qc that
> @@ -5538,10 +5540,13 @@ int sata_link_init_spd(struct ata_link *link)
>   *	LOCKING:
>   *	Inherited from calling layer (may sleep).
>   */
> -struct ata_port *ata_port_alloc(struct ata_host *host)
> +struct ata_port *ata_port_alloc(struct ata_host *host, int port_no)
>  {
>  	struct ata_port *ap;
>  	int id;
> +#ifdef CONFIG_LEDS_TRIGGER_DISK
> +	char name[32];
> +#endif
>  
>  	ap = kzalloc(sizeof(*ap), GFP_KERNEL);
>  	if (!ap)
> @@ -5557,6 +5562,7 @@ struct ata_port *ata_port_alloc(struct ata_host *host)
>  	ap->print_id = id;
>  	ap->host = host;
>  	ap->dev = host->dev;
> +	ap->port_no = port_no;

Please extract this change in a prep patch.

>  
>  	mutex_init(&ap->scsi_scan_mutex);
>  	INIT_DELAYED_WORK(&ap->hotplug_task, ata_scsi_hotplug);
> @@ -5579,6 +5585,11 @@ struct ata_port *ata_port_alloc(struct ata_host *host)
>  
>  	ata_force_pflags(ap);
>  
> +#ifdef CONFIG_LEDS_TRIGGER_DISK
> +	if (snprintf(name, sizeof(name), "%s-ata%d", dev_name(host->dev), port_no) < sizeof(name))
> +		ap->led_trigger = ledtrig_disk_trigger_register(name);
> +#endif

Same here: please define a helper function which is void for the
!CONFIG_LEDS_TRIGGER_DISK case. That will avoid both ifdefs here. Sprinkling
the code with such ifdef makes maintenance a nightmare. Wrap everything to
avoid that please.

> +
>  	return ap;
>  }
>  EXPORT_SYMBOL_GPL(ata_port_alloc);
> @@ -5588,6 +5599,10 @@ void ata_port_free(struct ata_port *ap)
>  	if (!ap)
>  		return;
>  
> +#ifdef CONFIG_LEDS_TRIGGER_DISK
> +	ledtrig_disk_trigger_unregister(ap->led_trigger);
> +#endif

Same comment. Use a void function or null macro to define this for the
!CONFIG_LEDS_TRIGGER_DISK case.

> +
>  	kfree(ap->pmp_link);
>  	kfree(ap->slave_link);
>  	ida_free(&ata_ida, ap->print_id);
> @@ -5690,11 +5705,10 @@ struct ata_host *ata_host_alloc(struct device *dev, int n_ports)
>  	for (i = 0; i < n_ports; i++) {
>  		struct ata_port *ap;
>  
> -		ap = ata_port_alloc(host);
> +		ap = ata_port_alloc(host, i);
>  		if (!ap)
>  			goto err_out;
>  
> -		ap->port_no = i;
>  		host->ports[i] = ap;
>  	}
>  
> diff --git a/drivers/leds/trigger/ledtrig-disk.c b/drivers/leds/trigger/ledtrig-disk.c
> index ed5ef83a5b35..fd25b4e45fb4 100644
> --- a/drivers/leds/trigger/ledtrig-disk.c
> +++ b/drivers/leds/trigger/ledtrig-disk.c

Can you try to split this part into a prep patch to avoid mixing led code and
ata code ?

> @@ -159,20 +159,22 @@ static int ledtrig_disk_activate(struct led_classdev *led_cdev)
>  	return 0;
>  }
>  
> -static struct led_trigger ledtrig_disk = {
> -	.name = "disk-activity",
> -	.activate = ledtrig_disk_activate,
> -	.groups = ledtrig_disk_groups,
> -};
> -static struct led_trigger ledtrig_disk_read = {
> -	.name = "disk-read",
> -	.activate = ledtrig_disk_activate,
> -	.groups = ledtrig_disk_groups,
> -};
> -static struct led_trigger ledtrig_disk_write = {
> -	.name = "disk-write",
> -	.activate = ledtrig_disk_activate,
> -	.groups = ledtrig_disk_groups,
> +static struct ledtrig_disk_trigger ledtrig_disk = {
> +	.all = {
> +		.name = "disk-activity",
> +		.activate = ledtrig_disk_activate,
> +		.groups = ledtrig_disk_groups,
> +	},
> +	.read = {
> +		.name = "disk-read",
> +		.activate = ledtrig_disk_activate,
> +		.groups = ledtrig_disk_groups,
> +	},
> +	.write = {
> +		.name = "disk-write",
> +		.activate = ledtrig_disk_activate,
> +		.groups = ledtrig_disk_groups,
> +	},
>  };
>  
>  static void ledtrig_disk_blink_oneshot(struct led_trigger *trig)
> @@ -189,21 +191,121 @@ static void ledtrig_disk_blink_oneshot(struct led_trigger *trig)
>  	rcu_read_unlock();
>  }
>  
> -void ledtrig_disk_activity(bool write)
> +static void ledtrig_disk_trigger_activity(struct ledtrig_disk_trigger *trig, bool write)
>  {
> -	ledtrig_disk_blink_oneshot(&ledtrig_disk);
> +	if (IS_ERR_OR_NULL(trig))
> +		return;
> +	ledtrig_disk_blink_oneshot(&trig->all);
>  	if (write)
> -		ledtrig_disk_blink_oneshot(&ledtrig_disk_write);
> +		ledtrig_disk_blink_oneshot(&trig->write);
>  	else
> -		ledtrig_disk_blink_oneshot(&ledtrig_disk_read);
> +		ledtrig_disk_blink_oneshot(&trig->read);
> +}
> +
> +void ledtrig_disk_activity(struct ledtrig_disk_trigger *port, bool write)
> +{
> +	ledtrig_disk_trigger_activity(&ledtrig_disk, write);
> +	ledtrig_disk_trigger_activity(port, write);
>  }
>  EXPORT_SYMBOL(ledtrig_disk_activity);
>  
> +struct ledtrig_disk_trigger *ledtrig_disk_trigger_register(const char *name)
> +{
> +	struct ledtrig_disk_trigger *trigger = kzalloc(sizeof(*trigger), GFP_KERNEL);
> +	int ret, n;
> +
> +	if (!trigger)
> +		return ERR_PTR(-ENOMEM);
> +
> +	trigger->all.name = kzalloc(TRIG_NAME_MAX, GFP_KERNEL);
> +	if (!trigger->all.name) {
> +		ret = -ENOMEM;
> +		goto err1;
> +	}
> +
> +	n = snprintf((char *)trigger->all.name, TRIG_NAME_MAX, "%s-disk-activity", name);
> +	if (n >= TRIG_NAME_MAX) {
> +		ret = -E2BIG;
> +		goto err1;
> +	}
> +
> +	trigger->all.activate = ledtrig_disk_activate;
> +	trigger->all.groups = ledtrig_disk_groups;
> +
> +	ret = led_trigger_register(&trigger->all);
> +	if (ret)
> +		goto err1;
> +
> +	trigger->read.name = kzalloc(TRIG_NAME_MAX, GFP_KERNEL);
> +	if (!trigger->read.name) {
> +		ret = -ENOMEM;
> +		goto err2;
> +	}
> +
> +	n = snprintf((char *)trigger->read.name, TRIG_NAME_MAX, "%s-disk-read", name);
> +	if (n >= TRIG_NAME_MAX) {
> +		ret = -E2BIG;
> +		goto err2;
> +	}
> +
> +	trigger->read.activate = ledtrig_disk_activate;
> +	trigger->read.groups = ledtrig_disk_groups;
> +
> +	ret = led_trigger_register(&trigger->read);
> +	if (ret)
> +		goto err2;
> +
> +	trigger->write.name = kzalloc(TRIG_NAME_MAX, GFP_KERNEL);
> +	if (!trigger->write.name) {
> +		ret = -ENOMEM;
> +		goto err3;
> +	}
> +
> +	n = snprintf((char *)trigger->write.name, TRIG_NAME_MAX, "%s-disk-write", name);
> +	if (n >= TRIG_NAME_MAX) {
> +		ret = -E2BIG;
> +		goto err3;
> +	}
> +
> +	trigger->write.activate = ledtrig_disk_activate;
> +	trigger->write.groups = ledtrig_disk_groups;
> +
> +	ret = led_trigger_register(&trigger->write);
> +	if (ret)
> +		goto err3;
> +
> +	return trigger;
> +
> +err3:
> +	led_trigger_unregister(&trigger->read);
> +err2:
> +	led_trigger_unregister(&trigger->all);
> +err1:
> +	kfree(trigger->all.name);
> +	kfree(trigger->read.name);
> +	kfree(trigger->write.name);
> +	kfree(trigger);
> +
> +	return ERR_PTR(ret);
> +}
> +EXPORT_SYMBOL(ledtrig_disk_trigger_register);
> +
> +void ledtrig_disk_trigger_unregister(struct ledtrig_disk_trigger *trig)
> +{
> +	if (IS_ERR_OR_NULL(trig))
> +		return;
> +
> +	led_trigger_unregister(&trig->all);
> +	led_trigger_unregister(&trig->read);
> +	led_trigger_unregister(&trig->write);
> +}
> +EXPORT_SYMBOL(ledtrig_disk_trigger_unregister);
> +
>  static int __init ledtrig_disk_init(void)
>  {
> -	led_trigger_register(&ledtrig_disk);
> -	led_trigger_register(&ledtrig_disk_read);
> -	led_trigger_register(&ledtrig_disk_write);
> +	led_trigger_register(&ledtrig_disk.all);
> +	led_trigger_register(&ledtrig_disk.read);
> +	led_trigger_register(&ledtrig_disk.write);
>  
>  	return 0;
>  }
> diff --git a/drivers/scsi/libsas/sas_ata.c b/drivers/scsi/libsas/sas_ata.c
> index bcecb4911da9..8841850684f7 100644
> --- a/drivers/scsi/libsas/sas_ata.c
> +++ b/drivers/scsi/libsas/sas_ata.c
> @@ -587,14 +587,13 @@ int sas_ata_init(struct domain_device *found_dev)
>  
>  	ata_host_init(ata_host, ha->dev, &sas_sata_ops);
>  
> -	ap = ata_port_alloc(ata_host);
> +	ap = ata_port_alloc(ata_host, 0);
>  	if (!ap) {
>  		pr_err("ata_port_alloc failed.\n");
>  		rc = -ENODEV;
>  		goto free_host;
>  	}
>  
> -	ap->port_no = 0;
>  	ap->pio_mask = ATA_PIO4;
>  	ap->mwdma_mask = ATA_MWDMA2;
>  	ap->udma_mask = ATA_UDMA6;
> diff --git a/include/linux/leds.h b/include/linux/leds.h
> index b16b803cc1ac..3221be97e9c0 100644
> --- a/include/linux/leds.h
> +++ b/include/linux/leds.h
> @@ -619,10 +619,22 @@ enum led_trigger_netdev_modes {
>  };
>  
>  /* Trigger specific functions */
> +struct ledtrig_disk_trigger {
> +	struct led_trigger all;
> +	struct led_trigger read;
> +	struct led_trigger write;
> +};
>  #ifdef CONFIG_LEDS_TRIGGER_DISK
> -void ledtrig_disk_activity(bool write);
> +struct ledtrig_disk_trigger *ledtrig_disk_trigger_register(const char *name);
> +void ledtrig_disk_trigger_unregister(struct ledtrig_disk_trigger *trig);
> +void ledtrig_disk_activity(struct ledtrig_disk_trigger *port, bool write);
>  #else
> -static inline void ledtrig_disk_activity(bool write) {}
> +static inline struct ledtrig_disk_trigger *ledtrig_disk_trigger_register(const char *name)
> +{
> +	return ERR_PTR(-EOPNOTSUPP);
> +}
> +static inline void ledtrig_disk_trigger_unregister(struct ledtrig_disk_trigger *trig) {}
> +static inline void ledtrig_disk_activity(struct ledtrig_disk_trigger *port, bool write) {}
>  #endif
>  
>  #ifdef CONFIG_LEDS_TRIGGER_MTD
> diff --git a/include/linux/libata.h b/include/linux/libata.h
> index 39534fafa36a..50124d170d13 100644
> --- a/include/linux/libata.h
> +++ b/include/linux/libata.h
> @@ -940,6 +940,10 @@ struct ata_port {
>  #ifdef CONFIG_ATA_ACPI
>  	struct ata_acpi_gtm	__acpi_init_gtm; /* use ata_acpi_init_gtm() */
>  #endif
> +
> +#ifdef CONFIG_LEDS_TRIGGER_DISK
> +	struct ledtrig_disk_trigger *led_trigger;
> +#endif
>  };
>  
>  /* The following initializer overrides a method to NULL whether one of
> @@ -1307,7 +1311,7 @@ extern int sata_link_scr_lpm(struct ata_link *link, enum ata_lpm_policy policy,
>  			     bool spm_wakeup);
>  extern int ata_slave_link_init(struct ata_port *ap);
>  extern void ata_port_probe(struct ata_port *ap);
> -extern struct ata_port *ata_port_alloc(struct ata_host *host);
> +extern struct ata_port *ata_port_alloc(struct ata_host *host, int port_no);
>  extern void ata_port_free(struct ata_port *ap);
>  extern int ata_tport_add(struct device *parent, struct ata_port *ap);
>  extern void ata_tport_delete(struct ata_port *ap);
> 


-- 
Damien Le Moal
Western Digital Research

